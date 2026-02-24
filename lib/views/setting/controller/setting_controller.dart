import 'package:glady/core/api/model/basic_success_model.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

class SettingController extends GetxController {
  RxBool isLoading = false.obs;

  // Future<BasicSuccessModel> deleteUserAccount() async {
  //   return await ApiRequest.delete(
  //     fromJson: BasicSuccessModel.fromJson,
  //     endPoint: ApiEndPoints.deleteProfile,
  //     isLoading: isLoading,
  //     showSuccessSnackBar: true,
  //     onSuccess: (result) {
  //       Get.back();
  //       AppStorage.clear();
  //       Get.offAllNamed(Routes.welcomeScreen);
  //     },
  //   );
  // }



  Future<void> deleteUserAccount() async {}
}
