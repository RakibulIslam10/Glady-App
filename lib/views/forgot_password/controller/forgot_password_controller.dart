import '../../../core/utils/basic_import.dart';
class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  // email
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final isEmailValid = false.obs;

  // Forget password api
  RxBool isLoading = false.obs;









}
