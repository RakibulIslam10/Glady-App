import 'package:glady/core/utils/app_storage.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/navigation_controller.dart';
part 'navigation_screen_mobile.dart';
part '../widget/bottom_widget.dart';

class NavigationScreen extends GetView<NavigationController> {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: NavigationScreenMobile());
  }
}
