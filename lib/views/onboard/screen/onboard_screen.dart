import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/onboard_controller.dart';

part 'onboard_screen_mobile.dart';

class OnboardScreen extends GetView<OnboardController> {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: OnboardScreenMobile());
  }
}
