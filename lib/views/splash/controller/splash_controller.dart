import '../../../core/utils/basic_import.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.loginScreen);

      // if (!AppStorage.onboardSave) {
      //   // User has not completed onboarding
      //   Get.offAllNamed(Routes.onboardScreen);
      // } else if (AppStorage.isLoggedIn) {
      //   // Onboarding done & user logged in
      //   Get.offAllNamed(Routes.navigationScreen);
      // } else {
      //   // Onboarding done but user not logged in
      //   Get.offAllNamed(Routes.loginScreen);
      // }
    });
  }
}
