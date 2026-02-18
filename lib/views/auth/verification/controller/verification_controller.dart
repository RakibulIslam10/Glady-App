import 'package:glady/core/api/model/basic_success_model.dart';
import 'package:glady/core/utils/app_storage.dart';
import 'package:glady/views/auth/doctor_register/controller/doctor_register_controller.dart';
import 'package:glady/views/auth/register/controller/register_controller.dart';
import '../../../../core/api/services/auth_services.dart';
import '../../../../core/utils/basic_import.dart';
import '../../login/model/login_model.dart';

class VerificationController extends GetxController {
  final otpController = TextEditingController();
  final code = ''.obs;
  final isLoading = false.obs;
  final isClipboardDetected = false.obs;
  final email = ''.obs;



  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['email'] != null) {
      email.value = Get.arguments['email'];
    }
  }



  RxBool isResending = false.obs;

  Future<BasicSuccessModel> resendOtpProcess() async {
    return await AuthService.resendOtpService(
      isLoading: isResending,
      email: email.value,
    );
  }

  Future<LoginModel> verifyOtp() async {
    if (email.value.isEmpty) {
      CustomSnackBar.error("Registration data not found");
      return Future.error("No email found");
    }

    return await AuthService.registerOtpVerifyService(
      isLoading: isLoading,
      code: code.value,
      email: email.value,
    );
  }
}
