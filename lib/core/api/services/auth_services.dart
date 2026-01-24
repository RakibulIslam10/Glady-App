import 'dart:developer';
import 'package:glady/views/auth/login/model/login_model.dart';

import '../../utils/app_storage.dart';
import '../../utils/basic_import.dart';
import '../../widgets/confirmation_widget.dart';
import '../end_point/api_end_points.dart';
import '../model/basic_success_model.dart';
import 'api_request.dart';

class AuthService {
  static final ApiRequest _api = ApiRequest();

  /// =============================================== ✅ Login ================================================== ///
  /*
  Usage:
  ──────────────────────────────────────────────────────────────────────────
  RxBool isLoading = false.obs;

  loginProcess() async {
    return await AuthService.loginService(
      isLoading: isLoading,
      email: emailController.text,
      password: passwordController.text,
    );
  }
  ──────────────────────────────────────────────────────────────────────────
  */
  static Future<LoginModel> loginService({
    required RxBool isLoading,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> inputBody = {
      'email': email.trim(),
      'password': password,
    };

    return await _api.post(
      fromJson: LoginModel.fromJson,
      endPoint: ApiEndPoints.login,
      isLoading: isLoading,
      body: inputBody,
      showSuccessSnackBar: false,
      enableRetry: true,
      maxRetries: 2,
      onSuccess: (result) {
        // ✅ Save to AppStorage
        AppStorage.save(
          token: result.data?.accessToken,
          isUser: result.data?.role,
          isLoggedIn: true,
        );

        Get.offAllNamed(Routes.navigationScreen);

        log('✅ Login successful - Token saved');
      },
    );
  }

  /// =============================================== ✅ Register ================================================== ///
  /*
  Usage:
  ──────────────────────────────────────────────────────────────────────────
  RxBool isLoading = false.obs;

  registerProcess() async {
    return await AuthService.registerService(
      isLoading: isLoading,
      fullName: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text, // optional
    );
  }
  ──────────────────────────────────────────────────────────────────────────
  */
  static Future<BasicSuccessModel> registerService({
    required RxBool isLoading,
    required String fullName,
    required String email,
    required String password,
    required String role,
    String? phone,
  }) async {
    Map<String, dynamic> inputBody = {
      'name': fullName.trim(),
      'email': email.trim(),
      'password': password,
      'role': role,
      if (phone != null && phone.isNotEmpty) 'phone': phone.trim(),
    };

    return await _api.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.register,
      isLoading: isLoading,
      body: inputBody,
      showSuccessSnackBar: true,
      enableRetry: true,
      maxRetries: 2,
      onSuccess: (result) {
        // ✅ Save token to AppStorage
        // AppStorage.save(token: result.data.accessToken, isLoggedIn: true, isUser: role);
        Get.toNamed(Routes.verificationScreen);

        log('✅ Registration successful - Token saved');
      },
    );
  }

  /// =============================================== ✅ OTP Verification ================================================== ///
  /*
  Usage:
  ──────────────────────────────────────────────────────────────────────────
  RxBool isLoading = false.obs;

  otpVerifyProcess() async {
    // Get email from storage or pass as argument
    String email = AppStorage.tempEmail; // or from Get.arguments

    return await AuthService.otpVerifyService(
      isLoading: isLoading,
      code: otpController.text,
      email: email,
    );
  }
  ──────────────────────────────────────────────────────────────────────────
  */
  static Future<LoginModel> otpVerifyService({
    required RxBool isLoading,
    required String code,
    required String email,
  }) async {
    Map<String, dynamic> inputBody = {
      'email': email.trim(),
      'otp': code.trim(),
    };

    return await _api.post(
      fromJson: LoginModel.fromJson,
      endPoint: ApiEndPoints.verifyOtp,
      isLoading: isLoading,
      body: inputBody,
      showSuccessSnackBar: false,
      enableRetry: false,
      onSuccess: (result) {
        AppStorage.save(
          isLoggedIn: true,
          token: result.data?.accessToken,
          isUser: result.data?.role,
        );

        if (AppStorage.isUser == 'USER') {
          log('USER');
          Get.offAllNamed(Routes.navigationScreen);
        } else {
          Get.toNamed(Routes.aditionalScreen);
        }
        log('✅ OTP verified successfully');
      },
    );
  }

  /// =============================================== ✅ Resend OTP ================================================== ///
  /*
  Usage:
  ──────────────────────────────────────────────────────────────────────────
  RxBool isResending = false.obs;

  resendOtpProcess() async {
    String email = AppStorage.tempEmail; // or from Get.arguments

    return await AuthService.resendOtpService(
      isLoading: isResending,
      email: email,
    );
  }
  ──────────────────────────────────────────────────────────────────────────
  */
  static Future<BasicSuccessModel> resendOtpService({
    required RxBool isLoading,
    required String email,
  }) async {
    Map<String, dynamic> inputBody = {'email': email.trim()};

    return await _api.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.resendOtp,
      isLoading: isLoading,
      body: inputBody,
      showSuccessSnackBar: true,
      enableRetry: false,
      onSuccess: (result) {
        log('✅ OTP resent successfully');
      },
    );
  }

  /// =============================================== ✅ Forgot Password ================================================== ///
  /*
  Usage:
  ──────────────────────────────────────────────────────────────────────────
  RxBool isLoading = false.obs;

  forgotPasswordProcess() async {
    return await AuthService.forgotPasswordService(
      isLoading: isLoading,
      email: emailController.text,
    );
  }
  ──────────────────────────────────────────────────────────────────────────
  */
  static Future<BasicSuccessModel> forgotPasswordService({
    required RxBool isLoading,
    required String email,
  }) async {
    Map<String, dynamic> inputBody = {'email': email.trim()};

    return await _api.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.forgotPassword,
      isLoading: isLoading,
      body: inputBody,
      showSuccessSnackBar: true,
      enableRetry: true,
      maxRetries: 2,
      onSuccess: (result) {
        Get.toNamed(Routes.otpScreen);

        log('✅ Forgot password email sent - OTP verification required');
      },
    );
  }

  /// =============================================== ✅ Reset Password ================================================== ///
  /*
  Usage:
  ──────────────────────────────────────────────────────────────────────────
  RxBool isLoading = false.obs;

  resetPasswordProcess() async {
    // Get email from storage or pass as argument
    String email = AppStorage.tempEmail; // or from Get.arguments

    return await AuthService.resetPasswordService(
      isLoading: isLoading,
      password: passwordController.text,
      email: email,
    );
  }
  ──────────────────────────────────────────────────────────────────────────
  */
  static Future<BasicSuccessModel> resetPasswordService({
    required RxBool isLoading,
    required String password,
    required String email,
  }) async {
    Map<String, dynamic> inputBody = {
      'email': email.trim(),
      'newPassword': password,
    };

    return await _api.patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.resetPassword,
      isLoading: isLoading,
      body: inputBody,
      showSuccessSnackBar: true,
      enableRetry: false,
      onSuccess: (result) {
        // ✅ Clear temp data after successful reset
        // AppStorage.clearTempData();

        // ✅ Navigate to Login Screen
        // Get.offAllNamed(Routes.loginScreen);

        log('✅ Password reset successful - Please login with new password');
      },
    );
  }

  /// =============================================== ✅ Change Password ================================================== ///
  /*
  Usage:
  ──────────────────────────────────────────────────────────────────────────
  RxBool isLoading = false.obs;

  changePasswordProcess() async {
    return await AuthService.changePasswordService(
      isLoading: isLoading,
      oldPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
    );
  }
  ──────────────────────────────────────────────────────────────────────────
  */
  static Future<BasicSuccessModel> changePasswordService({
    required RxBool isLoading,
    required String oldPassword,
    required String newPassword,
  }) async {
    Map<String, dynamic> inputBody = {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      // 'confirmPassword': newPassword,
    };

    return await _api.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.changePassword,
      isLoading: isLoading,
      body: inputBody,
      showSuccessSnackBar: false,
      enableRetry: false,
      onSuccess: (result) {
        Get.offAll(
          ConfirmationWidget(
            iconPath: Assets.icons.vector,
            title: "Password Update Successfully",
            subtitle:
            'your password has been changed successfully',
          ),
        );
        log('✅ Password changed successfully');
      },
    );
  }

  /// =============================================== ✅ Logout ================================================== ///
  /*
  Usage:
  ──────────────────────────────────────────────────────────────────────────
  // Option 1: Simple logout (no API call)
  logoutProcess() {
    AuthService.logoutService();
  }

  // Option 2: Logout with API call
  RxBool isLoading = false.obs;

  logoutProcess() async {
    await AuthService.logoutService(
      isLoading: isLoading,
      callApi: true, // if backend requires logout endpoint
    );
  }

  ──────────────────────────────────────────────────────────────────────────
  */
  static Future<void> logoutService({
    RxBool? isLoading,
    bool callApi = false,
    bool showSuccessSnackBar = true,
  }) async {
    try {
      if (callApi) {
        await _api.post(
          fromJson: BasicSuccessModel.fromJson,
          endPoint: ApiEndPoints.logout,
          isLoading: isLoading ?? false.obs,
          body: {},
          showSuccessSnackBar: showSuccessSnackBar,
          checkNetwork: false,
        );
      }

      AppStorage.clear();
      Get.offAllNamed(Routes.loginScreen);
      log('✅ Logout successful - All data cleared');
    } catch (e) {
      log('⚠️ Logout API failed, but clearing local data anyway');
      AppStorage.clear();
      Get.offAllNamed(Routes.loginScreen);
    }
  }
}
