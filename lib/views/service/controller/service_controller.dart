import 'package:glady/core/api/model/basic_success_model.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

class ServiceController extends GetxController {
  final serviceNameController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<BasicSuccessModel> addService() async {
    return ApiRequest().post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.addServiceDoctor,
      isLoading: isLoading,
      body: {"name": serviceNameController.text},
      showSuccessSnackBar: true,
      onSuccess: (result) {
        Get.close(1);
      },
    );
  }
}
