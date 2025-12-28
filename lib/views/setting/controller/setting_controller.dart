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


Future<void> deleteUserAccount ()async{}
}
