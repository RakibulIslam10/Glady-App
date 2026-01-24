import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import '../../helpers/network_manager.dart';
import '../../utils/app_storage.dart';
import '../../utils/basic_import.dart' hide FormData, MultipartFile;
import '../end_point/api_end_points.dart';

class ApiRequest {
  static Dio? _dio;

  /// ✅ Initialize Dio instance
  Dio get instance {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndPoints.baseUrl,
          connectTimeout: const Duration(seconds: 120),
          receiveTimeout: const Duration(seconds: 120),
          sendTimeout: const Duration(seconds: 120),
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      // ✅ Add interceptors for logging
      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            log(
              '╔════════════════════════════════════════════════════════════════════════════════════════════',
            );
            log('📍 [DIO] End Point: ${options.baseUrl}${options.path}');
            if (options.queryParameters.isNotEmpty) {
              log('🔍 Query Params: ${options.queryParameters}');
            }
            if (options.data != null) {
              log('📦 Request Body:');
              if (options.data is Map) {
                (options.data as Map).forEach((key, value) {
                  log("🔹 '$key': '$value'");
                });
              } else {
                log(options.data.toString());
              }
            }
            log(
              '╚════════════════════════════════════════════════════════════════════════════════════════════',
            );
            return handler.next(options);
          },
          onResponse: (response, handler) {
            log('|✅|---------[ ✅ DIO REQUEST COMPLETED ]---------|✅|');
            return handler.next(response);
          },
          onError: (error, handler) {
            log('❌ [DIO] Error: ${error.message}');
            return handler.next(error);
          },
        ),
      );
    }
    return _dio!;
  }

  /// ✅ Header Generator
  Future<Map<String, String>> _bearerHeaderInfo([String? token]) async {
    final authToken = token ?? AppStorage.token;
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      if (authToken.isNotEmpty)
        HttpHeaders.authorizationHeader: "Bearer $authToken",
    };
  }

  /// ✅ Network Check using your existing NetworkChecker
  Future<void> _checkNetwork() async {
    try {
      final hasConnection = await NetworkChecker.instance.hasConnection();
      if (!hasConnection) {
        throw NetworkException('No internet connection');
      }
    } catch (e) {
      throw NetworkException('Please check your internet connection');
    }
  }

  /// ✅ Error Handler
  Exception _handleError(DioException e) {
    if (e.type == DioExceptionType.cancel) {
      return CancelledException();
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return TimeoutException('Request timeout. Please try again.');
    } else if (e.response?.statusCode == 401) {
      // ✅ Backend থেকে message নাও
      final message = e.response?.data['message'] ?? 'Session expired. Please login again.';

      // AppStorage.clear();
      // Get.offAllNamed(Routes.loginScreen);

      return UnauthorizedException(message);
    } else if (e.response?.statusCode != null) {
      final message = e.response?.data['message'] ?? 'Something went wrong';
      return ServerException(
        message: message,
        statusCode: e.response?.statusCode,
      );
    } else {
      return ApiException(message: e.message ?? 'Unknown error occurred');
    }
  }

  /// ✅ Common Error Handler Method
  void _handleDioException(Exception error) {
    log('🐞🐞🐞 DIO ERROR: ${error.toString()}');

    String errorMessage;

    if (error is UnauthorizedException) {
      errorMessage = error.message;
    } else if (error is ServerException) {
      errorMessage = error.message;
    } else if (error is ApiException) {
      errorMessage = error.message;
    } else if (error is TimeoutException) {
      errorMessage = error.message ?? 'Request timeout. Please try again.';
    } else if (error is CancelledException) {
      errorMessage = 'Request cancelled';
    } else if (error is NetworkException) {
      errorMessage = error.message;
    } else {
      errorMessage = 'Something went wrong. Please try again.';
    }

    CustomSnackBar.error(errorMessage);
  }

  /// =========================================================== ✅ DIO POST REQUEST =========================================================== ///
  Future<R> post<R>({
    required R Function(Map<String, dynamic>) fromJson,
    required String endPoint,
    required RxBool isLoading,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    bool showSuccessSnackBar = false,
    Function(R result)? onSuccess,
    bool progressShow = false,
    Function(int sent, int total)? onProgress,
    bool enableRetry = true,
    int maxRetries = 3,
    String? cancelKey,
    bool checkNetwork = true,
  }) async {
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        if (checkNetwork) await _checkNetwork();

        isLoading.value = true;
        log('|📤|---------[ 📦 DIO POST REQUEST STARTED ]---------|📤|');

        final cancelToken = cancelKey != null
            ? RequestCancellation.getToken(cancelKey)
            : null;

        final response = await instance.post(
          endPoint,
          data: body,
          queryParameters: queryParams,
          cancelToken: cancelToken,
          options: Options(headers: await _bearerHeaderInfo()),
          onSendProgress: progressShow
              ? (sent, total) {
                  final progress = (sent / total * 100).toStringAsFixed(0);
                  log('📊 Upload Progress: $progress% ($sent/$total bytes)');
                  if (onProgress != null) {
                    onProgress(sent, total);
                  }
                }
              : null,
        );

        if (cancelKey != null) RequestCancellation.removeToken(cancelKey);

        log('|✅|---------[ ✅ DIO POST REQUEST COMPLETED ]---------|✅|');

        if (response.statusCode == 200 || response.statusCode == 201) {
          final Map<String, dynamic> json = response.data;
          final result = fromJson(json);

          final successMessage =
              json['message'] ?? Strings.requestCompletedSuccessfully;
          if (showSuccessSnackBar) {
            CustomSnackBar.success(
              title: Strings.success,
              message: successMessage,
            );
          }
          if (onSuccess != null) onSuccess(result);
          return result;
        } else {
          final errorMessage =
              response.data['message'] ?? 'Something went wrong!';
          log('❌ Error: $errorMessage');
          CustomSnackBar.error(errorMessage);
          throw ApiException(
            message: errorMessage,
            statusCode: response.statusCode,
          );
        }
      } on DioException catch (e) {
        final error = _handleError(e);

        if (!enableRetry ||
            error is CancelledException ||
            error is UnauthorizedException) {
          _handleDioException(error);
          throw error;
        }

        retryCount++;
        if (retryCount >= maxRetries) {
          log('🐞🐞🐞 MAX RETRIES REACHED: ${error.toString()}');
          CustomSnackBar.error(error.toString());
          throw error;
        }

        log('⚠️ Retry attempt $retryCount/$maxRetries');
        await Future.delayed(Duration(seconds: retryCount * 2));
      } catch (e) {
        log('🐞🐞🐞 ERROR: ${e.toString()}');
        if (e is! NetworkException) {
          CustomSnackBar.error(e.toString());
        }
        rethrow;
      } finally {
        isLoading.value = false;
      }
    }

    throw ApiException(message: 'Request failed after $maxRetries attempts');
  }

  /// =========================================================== ✅ DIO GET REQUEST =========================================================== ///
  Future<R> get<R>({
    required R Function(Map<String, dynamic>) fromJson,
    required String endPoint,
    required RxBool isLoading,
    String? id,
    Map<String, dynamic>? queryParams,
    bool showSuccessSnackBar = false,
    bool showResponse = false,
    Function(R result)? onSuccess,
    bool isPagination = false,
    int page = 1,
    int limit = 15,
    bool progressShow = false,
    Function(int received, int total)? onProgress,
    bool enableRetry = true,
    int maxRetries = 3,
    String? cancelKey,
    bool checkNetwork = true,
  }) async {
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        if (checkNetwork) await _checkNetwork();

        isLoading.value = true;
        log('|📥|---------[ 🌐 DIO GET REQUEST STARTED ]---------|📥|');

        String fullEndPoint = endPoint;
        if (id != null && id.isNotEmpty) {
          fullEndPoint += '/$id';
        }

        if (isPagination) {
          queryParams ??= {};
          queryParams['page'] = page;
          queryParams['limit'] = limit;
        }

        final cancelToken = cancelKey != null
            ? RequestCancellation.getToken(cancelKey)
            : null;

        final response = await instance.get(
          fullEndPoint,
          queryParameters: queryParams,
          cancelToken: cancelToken,
          options: Options(headers: await _bearerHeaderInfo()),
          onReceiveProgress: progressShow
              ? (received, total) {
                  if (total != -1) {
                    final progress = (received / total * 100).toStringAsFixed(
                      0,
                    );
                    log(
                      '📊 Download Progress: $progress% ($received/$total bytes)',
                    );
                    if (onProgress != null) {
                      onProgress(received, total);
                    }
                  }
                }
              : null,
        );

        if (cancelKey != null) RequestCancellation.removeToken(cancelKey);

        if (showResponse) {
          try {
            final prettyJson = const JsonEncoder.withIndent(
              '  ',
            ).convert(response.data);
            log('|📤|---------[ RESPONSE BODY ]---------|📤|');
            log(prettyJson);
            log('|📤|---------------------------------|📤|');
          } catch (_) {
            log('|📤| RESPONSE (raw) |📤|: ${response.data}');
          }
        }

        log('|✅|---------[ ✅ DIO GET REQUEST COMPLETED ]---------|✅|');
        log(
          '╚════════════════════════════════════════════════════════════════════════════════════════════',
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> json = response.data;
          final result = fromJson(json);

          final successMessage =
              json['message'] ?? Strings.requestCompletedSuccessfully;
          if (showSuccessSnackBar) {
            CustomSnackBar.success(
              title: Strings.success,
              message: successMessage,
            );
          }
          if (onSuccess != null) onSuccess(result);
          return result;
        } else {
          final errorMessage =
              response.data['message'] ?? 'Something went wrong!';
          log('❌ Error: $errorMessage');
          CustomSnackBar.error(errorMessage);
          throw ApiException(
            message: errorMessage,
            statusCode: response.statusCode,
          );
        }
      } on DioException catch (e) {
        final error = _handleError(e);

        if (!enableRetry ||
            error is CancelledException ||
            error is UnauthorizedException) {
          _handleDioException(error);
          throw error;
        }

        retryCount++;
        if (retryCount >= maxRetries) {
          log('🐞🐞🐞 MAX RETRIES REACHED: ${error.toString()}');
          CustomSnackBar.error(error.toString());
          throw error;
        }

        log('⚠️ Retry attempt $retryCount/$maxRetries');
        await Future.delayed(Duration(seconds: retryCount * 2));
      } catch (e) {
        log('🐞🐞🐞 ERROR: ${e.toString()}');
        if (e is! NetworkException) {
          CustomSnackBar.error(e.toString());
        }
        rethrow;
      } finally {
        isLoading.value = false;
      }
    }

    throw ApiException(message: 'Request failed after $maxRetries attempts');
  }

  /// =========================================================== ✅ DIO PATCH REQUEST =========================================================== ///
  Future<R> patch<R>({
    required R Function(Map<String, dynamic>) fromJson,
    required String endPoint,
    required RxBool isLoading,
    required Map<String, dynamic> body,
    String? id,
    Map<String, dynamic>? queryParams,
    bool showSuccessSnackBar = false,
    Function(R result)? onSuccess,
    bool progressShow = false,
    Function(int sent, int total)? onProgress,
    bool enableRetry = true,
    int maxRetries = 3,
    String? cancelKey,
    bool checkNetwork = true,
  }) async {
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        if (checkNetwork) await _checkNetwork();

        isLoading.value = true;
        log('|📤|---------[ 📦 DIO PATCH REQUEST STARTED ]---------|📤|');

        final fullEndPoint = id != null ? '$endPoint/$id' : endPoint;
        final cancelToken = cancelKey != null
            ? RequestCancellation.getToken(cancelKey)
            : null;

        final response = await instance.patch(
          fullEndPoint,
          data: body,
          queryParameters: queryParams,
          cancelToken: cancelToken,
          options: Options(headers: await _bearerHeaderInfo()),
          onSendProgress: progressShow
              ? (sent, total) {
                  final progress = (sent / total * 100).toStringAsFixed(0);
                  log('📊 Upload Progress: $progress% ($sent/$total bytes)');
                  if (onProgress != null) {
                    onProgress(sent, total);
                  }
                }
              : null,
        );

        if (cancelKey != null) RequestCancellation.removeToken(cancelKey);

        log('|✅|---------[ ✅ DIO PATCH REQUEST COMPLETED ]---------|✅|');

        if (response.statusCode == 200 || response.statusCode == 201) {
          final Map<String, dynamic> json = response.data;
          final result = fromJson(json);

          final successMessage =
              json['message'] ?? Strings.requestCompletedSuccessfully;
          if (showSuccessSnackBar) {
            CustomSnackBar.success(
              title: Strings.success,
              message: successMessage,
            );
          }
          if (onSuccess != null) onSuccess(result);
          return result;
        } else {
          final errorMessage =
              response.data['message'] ?? 'Something went wrong!';
          log('❌ Error: $errorMessage');
          CustomSnackBar.error(errorMessage);
          throw ApiException(
            message: errorMessage,
            statusCode: response.statusCode,
          );
        }
      } on DioException catch (e) {
        final error = _handleError(e);

        if (!enableRetry ||
            error is CancelledException ||
            error is UnauthorizedException) {
          _handleDioException(error);
          throw error;
        }

        retryCount++;
        if (retryCount >= maxRetries) {
          log('🐞🐞🐞 MAX RETRIES REACHED: ${error.toString()}');
          CustomSnackBar.error(error.toString());
          throw error;
        }

        log('⚠️ Retry attempt $retryCount/$maxRetries');
        await Future.delayed(Duration(seconds: retryCount * 2));
      } catch (e) {
        log('🐞🐞🐞 ERROR: ${e.toString()}');
        if (e is! NetworkException) {
          CustomSnackBar.error(e.toString());
        }
        rethrow;
      } finally {
        isLoading.value = false;
      }
    }

    throw ApiException(message: 'Request failed after $maxRetries attempts');
  }

  /// =========================================================== ✅ DIO PUT REQUEST =========================================================== ///
  Future<R> put<R>({
    required R Function(Map<String, dynamic>) fromJson,
    required String endPoint,
    required RxBool isLoading,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    bool showSuccessSnackBar = false,
    Function(R result)? onSuccess,
    bool progressShow = false,
    Function(int sent, int total)? onProgress,
    bool enableRetry = true,
    int maxRetries = 3,
    String? cancelKey,
    bool checkNetwork = true,
  }) async {
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        if (checkNetwork) await _checkNetwork();

        isLoading.value = true;
        log('|📤|---------[ 📦 DIO PUT REQUEST STARTED ]---------|📤|');

        final cancelToken = cancelKey != null
            ? RequestCancellation.getToken(cancelKey)
            : null;

        final response = await instance.put(
          endPoint,
          data: body,
          queryParameters: queryParams,
          cancelToken: cancelToken,
          options: Options(headers: await _bearerHeaderInfo()),
          onSendProgress: progressShow
              ? (sent, total) {
                  final progress = (sent / total * 100).toStringAsFixed(0);
                  log('📊 Upload Progress: $progress% ($sent/$total bytes)');
                  if (onProgress != null) {
                    onProgress(sent, total);
                  }
                }
              : null,
        );

        if (cancelKey != null) RequestCancellation.removeToken(cancelKey);

        log('|✅|---------[ ✅ DIO PUT REQUEST COMPLETED ]---------|✅|');

        if (response.statusCode == 200 || response.statusCode == 201) {
          final Map<String, dynamic> json = response.data;
          final result = fromJson(json);

          final successMessage =
              json['message'] ?? Strings.requestCompletedSuccessfully;
          if (showSuccessSnackBar) {
            CustomSnackBar.success(
              title: Strings.success,
              message: successMessage,
            );
          }
          if (onSuccess != null) onSuccess(result);
          return result;
        } else {
          final errorMessage =
              response.data['message'] ?? 'Something went wrong!';
          log('❌ Error: $errorMessage');
          CustomSnackBar.error(errorMessage);
          throw ApiException(
            message: errorMessage,
            statusCode: response.statusCode,
          );
        }
      } on DioException catch (e) {
        final error = _handleError(e);

        if (!enableRetry ||
            error is CancelledException ||
            error is UnauthorizedException) {
          _handleDioException(error);
          throw error;
        }

        retryCount++;
        if (retryCount >= maxRetries) {
          log('🐞🐞🐞 MAX RETRIES REACHED: ${error.toString()}');
          CustomSnackBar.error(error.toString());
          throw error;
        }

        log('⚠️ Retry attempt $retryCount/$maxRetries');
        await Future.delayed(Duration(seconds: retryCount * 2));
      } catch (e) {
        log('🐞🐞🐞 ERROR: ${e.toString()}');
        if (e is! NetworkException) {
          CustomSnackBar.error(e.toString());
        }
        rethrow;
      } finally {
        isLoading.value = false;
      }
    }

    throw ApiException(message: 'Request failed after $maxRetries attempts');
  }

  /// =========================================================== ✅ DIO DELETE REQUEST =========================================================== ///
  Future<R> delete<R>({
    required R Function(Map<String, dynamic>) fromJson,
    required String endPoint,
    String? id,
    required RxBool isLoading,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    bool showSuccessSnackBar = false,
    Function(R result)? onSuccess,
    bool enableRetry = true,
    int maxRetries = 3,
    String? cancelKey,
    bool checkNetwork = true,
  }) async {
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        if (checkNetwork) await _checkNetwork();

        isLoading.value = true;
        log('|📤|---------[ 📦 DIO DELETE REQUEST STARTED ]---------|📤|');

        final fullEndPoint = id != null ? '$endPoint/$id' : endPoint;
        final cancelToken = cancelKey != null
            ? RequestCancellation.getToken(cancelKey)
            : null;

        final response = await instance.delete(
          fullEndPoint,
          data: body,
          queryParameters: queryParams,
          cancelToken: cancelToken,
          options: Options(headers: await _bearerHeaderInfo()),
        );

        if (cancelKey != null) RequestCancellation.removeToken(cancelKey);

        log('|✅|---------[ ✅ DIO DELETE REQUEST COMPLETED ]---------|✅|');

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 204) {
          final Map<String, dynamic> json = response.data is Map
              ? response.data
              : {};
          final result = fromJson(json);

          final successMessage =
              json['message'] ?? Strings.requestCompletedSuccessfully;
          if (showSuccessSnackBar) {
            CustomSnackBar.success(
              title: Strings.success,
              message: successMessage,
            );
          }
          if (onSuccess != null) onSuccess(result);
          return result;
        } else {
          final errorMessage =
              response.data['message'] ?? 'Something went wrong!';
          log('❌ Error: $errorMessage');
          CustomSnackBar.error(errorMessage);
          throw ApiException(
            message: errorMessage,
            statusCode: response.statusCode,
          );
        }
      } on DioException catch (e) {
        final error = _handleError(e);

        if (!enableRetry ||
            error is CancelledException ||
            error is UnauthorizedException) {
          _handleDioException(error);
          throw error;
        }

        retryCount++;
        if (retryCount >= maxRetries) {
          log('🐞🐞🐞 MAX RETRIES REACHED: ${error.toString()}');
          CustomSnackBar.error(error.toString());
          throw error;
        }

        log('⚠️ Retry attempt $retryCount/$maxRetries');
        await Future.delayed(Duration(seconds: retryCount * 2));
      } catch (e) {
        log('🐞🐞🐞 ERROR: ${e.toString()}');
        if (e is! NetworkException) {
          CustomSnackBar.error(e.toString());
        }
        rethrow;
      } finally {
        isLoading.value = false;
      }
    }

    throw ApiException(message: 'Request failed after $maxRetries attempts');
  }

  /// ======================================================== ✅ DIO Multipart POST Method ========================================================= ///
  Future<R> multiMultipartRequest<R>({
    required String endPoint,
    required RxBool isLoading,
    required String reqType,
    required Map<String, dynamic> body,
    required Map<String, File?> files,
    Map<String, List<File>>? filesList,
    RxList<File>? selectedImages,
    List<String>? sizes,
    String? singleQueryParam,
    required R Function(Map<String, dynamic>) fromJson,
    bool showSuccessSnackBar = false,
    Function(R result)? onSuccess,
    String? token,
    bool progressShow = false,
    Function(int sent, int total)? onProgress,
    bool enableRetry = false,
    int maxRetries = 2,
    String? cancelKey,
    bool checkNetwork = true,
  }) async {
    int retryCount = 0;

    while (retryCount < maxRetries + 1) {
      try {
        if (checkNetwork) await _checkNetwork();

        isLoading.value = true;
        log('📤 DIO MULTIPART REQUEST STARTED');
        log('🔗 Method  : $reqType');

        String fullEndPoint = endPoint;
        if (singleQueryParam != null && singleQueryParam.isNotEmpty) {
          if (!singleQueryParam.startsWith('/')) fullEndPoint += '/';
          fullEndPoint += singleQueryParam;
        }

        log(
          '╔════════════════════════════════════════════════════════════════════════════════════════════',
        );
        log("📍 'End Point': '${ApiEndPoints.baseUrl}$fullEndPoint'");
        body.forEach((key, value) {
          log("🔹 '$key': '$value'");
        });
        log(
          '╚════════════════════════════════════════════════════════════════════════════════════════════',
        );

        final formData = FormData();

        // Add body fields
        body.forEach((key, value) {
          if (value is List || value is Map) {
            formData.fields.add(MapEntry(key, jsonEncode(value)));
          } else {
            formData.fields.add(MapEntry(key, value?.toString() ?? ''));
          }
        });

        // Add sizes if provided
        if (sizes != null && sizes.isNotEmpty) {
          formData.fields.add(MapEntry('sizes', jsonEncode(sizes)));
          log('📏 SIZES: $sizes');
        }

        // Add single files
        for (var entry in files.entries) {
          final file = entry.value;
          if (file == null) continue;

          final mimeType =
              lookupMimeType(file.path) ?? 'application/octet-stream';
          log('🧪 MIME TYPE for ${entry.key}: $mimeType');

          formData.files.add(
            MapEntry(
              entry.key,
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
                contentType: MediaType.parse(mimeType),
              ),
            ),
          );
        }

        // Add multiple images
        if (selectedImages != null && selectedImages.isNotEmpty) {
          for (var file in selectedImages) {
            final mimeType =
                lookupMimeType(file.path) ?? 'application/octet-stream';
            log('🖼️ Adding image: ${file.path} | MIME: $mimeType');

            formData.files.add(
              MapEntry(
                'images',
                await MultipartFile.fromFile(
                  file.path,
                  filename: file.path.split('/').last,
                  contentType: MediaType.parse(mimeType),
                ),
              ),
            );
          }
        }

        final headers = await _bearerHeaderInfo(token);
        final cancelToken = cancelKey != null
            ? RequestCancellation.getToken(cancelKey)
            : null;

        final response = await instance.request(
          fullEndPoint,
          data: formData,
          cancelToken: cancelToken,
          options: Options(
            method: reqType.toUpperCase(),
            headers: headers,
            contentType: 'multipart/form-data',
          ),
          onSendProgress: progressShow
              ? (sent, total) {
                  final progress = (sent / total * 100).toStringAsFixed(0);
                  log('📊 Upload Progress: $progress% ($sent/$total bytes)');
                  if (onProgress != null) {
                    onProgress(sent, total);
                  }
                }
              : null,
        );

        if (cancelKey != null) RequestCancellation.removeToken(cancelKey);

        log('📬 RESPONSE STATUS: ${response.statusCode}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          final json = response.data;
          final result = fromJson(json);

          if (showSuccessSnackBar) {
            final successMessage =
                json['message'] ?? 'Request completed successfully';
            CustomSnackBar.success(title: 'Success', message: successMessage);
          }

          if (onSuccess != null) onSuccess(result);
          return result;
        } else {
          final errorMessage =
              response.data['message'] ?? 'Something went wrong!';
          log('❌ MULTIPART ERROR: $errorMessage');
          CustomSnackBar.error(errorMessage);
          throw ApiException(
            message: errorMessage,
            statusCode: response.statusCode,
          );
        }
      } on DioException catch (e) {
        final error = _handleError(e);

        if (!enableRetry ||
            error is CancelledException ||
            error is UnauthorizedException) {
          _handleDioException(error);
          throw error;
        }

        retryCount++;
        if (retryCount > maxRetries) {
          log('🐞 MAX RETRIES REACHED: ${error.toString()}');
          CustomSnackBar.error(error.toString());
          throw error;
        }

        log('⚠️ Retry attempt $retryCount/$maxRetries');
        await Future.delayed(Duration(seconds: retryCount * 2));
      } catch (e) {
        log('🐞 MULTIPART ERROR: $e');
        if (e is! NetworkException) {
          CustomSnackBar.error(e.toString());
        }
        rethrow;
      } finally {
        isLoading.value = false;
      }
    }

    throw ApiException(message: 'Request failed after $maxRetries attempts');
  }

  /// =========================================================== ✅ DIO QUICK TOGGLE =========================================================== ///
  Future<bool> quickToggle({
    required dynamic itemId,
    required RxBool isFavorite,
    required String endPoint,
    String itemKey = 'product',
    VoidCallback? onSuccess,
    Function(String message)? onError,
    bool showSuccessSnackBar = false,
    String? customSuccessMessage,
    Map<String, dynamic>? customBody,
    Map<String, dynamic>? queryParams,
    bool checkNetwork = true,
  }) async {
    final oldValue = isFavorite.value;

    try {
      if (checkNetwork) await _checkNetwork();

      isFavorite.value = !oldValue;

      final body = customBody ?? {itemKey: itemId};

      final response = await instance.post(
        endPoint,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: await _bearerHeaderInfo()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> json = response.data;
        final isSuccess = json['success'] ?? true;

        if (isSuccess) {
          onSuccess?.call();
          if (showSuccessSnackBar) {
            final successMessage =
                customSuccessMessage ??
                json['message'] ??
                (isFavorite.value
                    ? 'Added to favorites'
                    : 'Removed from favorites');
            CustomSnackBar.success(
              title: Strings.success,
              message: successMessage,
            );
          }
          return true;
        } else {
          isFavorite.value = oldValue;
          final errorMessage = json['message'] ?? 'Favorite update failed';
          log('❌ Favorite Error: $errorMessage');
          onError?.call(errorMessage);
          return false;
        }
      } else {
        isFavorite.value = oldValue;
        final errorMessage = response.data.toString();
        log('❌  Error: $errorMessage');
        onError?.call(errorMessage);
        CustomSnackBar.error(errorMessage);
        return false;
      }
    } on DioException catch (e) {
      isFavorite.value = oldValue;
      final error = _handleError(e);
      log('🐞🐞🐞 DIO ERROR: ${error.toString()}');
      onError?.call(error.toString());
      CustomSnackBar.error(error.toString());
      return false;
    } catch (e) {
      isFavorite.value = oldValue;
      final errorMessage = 'Failed to update favorite';
      log('🐞🐞🐞 ERROR: ${e.toString()}');
      onError?.call(errorMessage);
      return false;
    }
  }
}
