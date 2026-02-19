import 'package:glady/core/widgets/confirmation_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/bottom_image_picker.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/support_controller.dart';

part 'support_screen_mobile.dart';

class SupportScreen extends GetView<SupportController> {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: SupportScreenMobile());
  }
}
