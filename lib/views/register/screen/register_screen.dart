import '../../../core/utils/app_storage.dart';
import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../../../widgets/custom_logo_widget.dart';
import '../controller/register_controller.dart';

part 'register_screen_mobile.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: RegisterScreenMobile());
  }
}
