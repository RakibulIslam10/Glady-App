import '../../../../core/api/model/basic_success_model.dart';
import '../../../../core/api/services/auth_services.dart';
import '../../../../core/utils/basic_import.dart';
class RegisterController extends GetxController {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();
  final confirmPasswordFocus = FocusNode();

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

  final isCheck = false.obs;

  //Register api
  RxBool isLoading = false.obs;
  Future<BasicSuccessModel>registerProcess() async {
    return await AuthService.registerService(
      isLoading: isLoading,
      fullName: nameController.text,
      email: emailController.text,
      password: passwordController.text, role: 'USER',
      doctorId: ''
    );
  }



}
