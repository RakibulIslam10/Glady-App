import 'package:glady/core/api/model/basic_success_model.dart';
import '../../../../core/api/services/auth_services.dart';
import '../../../../core/utils/basic_import.dart';

class ResetPasswordController extends GetxController {
  // password
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();
  final confirmPasswordFocus = FocusNode();
  final isPasswordValid = false.obs;
  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;
  RxBool isLoading = false.obs;

  Future<BasicSuccessModel> resetPasswordProcess() async {
    return await AuthService.resetPasswordService(
      isLoading: isLoading,
      password: passwordController.text,
    );
  }






}
