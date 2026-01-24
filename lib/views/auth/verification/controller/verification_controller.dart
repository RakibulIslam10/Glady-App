import 'package:glady/core/api/model/basic_success_model.dart';
import 'package:glady/views/auth/register/controller/register_controller.dart';
import '../../../../core/api/services/auth_services.dart';
import '../../../../core/utils/basic_import.dart';
import '../../login/model/login_model.dart';

class VerificationController extends GetxController {
  final otpController = TextEditingController();
  final code = ''.obs;
  final isLoading = false.obs;
  final isClipboardDetected = false.obs;

  @override
  void onInit() {
    super.onInit();
    _listenForSmsAutoFill();
  }

  // ✅ SMS Auto-fill listener
  void _listenForSmsAutoFill() {
    otpController.addListener(() {
      if (otpController.text.length == 6) {
        code.value = otpController.text;
        Future.delayed(Duration(milliseconds: 500), () {
          if (code.value.length == 6) {
            verifyOtp();
          }
        });
      }
    });
  }


  RxBool isResending = false.obs;

  Future<BasicSuccessModel> resendOtpProcess() async {

    return await AuthService.resendOtpService(
      isLoading: isResending,
      email: Get.find<RegisterController>().emailController.text,
    );
  }

  Future<LoginModel> verifyOtp() async {
    return await AuthService.otpVerifyService(
      isLoading: isLoading,
      code: code.value,
      email: Get.find<RegisterController>().emailController.text,
    );
  }
}
