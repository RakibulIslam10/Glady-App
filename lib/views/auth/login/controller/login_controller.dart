
import '../../../../core/api/services/auth_services.dart';
import '../../../../core/utils/basic_import.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // email
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final isEmailValid = false.obs;

  // password
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final isPasswordValid = false.obs;
  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;

  RxBool isLoading = false.obs;

  @override
  onInit(){
    super.onInit();
    emailController.text = '5xz@yopmail.com';
    passwordController.text = 'rakibulislam';
  }

   loginProcess() async {
    return await AuthService.loginService(
      isLoading: isLoading,
      email: emailController.text,
      password: passwordController.text,
    );
  }

}
