import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/offline_controller.dart';

part 'offline_screen_mobile.dart';

class OfflineScreen extends GetView<OfflineController> {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: OfflineScreenMobile());
  }
}
