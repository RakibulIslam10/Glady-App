import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/aditional_controller.dart';

part 'aditional_screen_mobile.dart';

class AditionalScreen extends GetView<AditionalController> {
  const AditionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: AditionalScreenMobile());
  }
}
