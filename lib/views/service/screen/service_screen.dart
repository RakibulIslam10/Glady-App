import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/service_controller.dart';

part 'service_screen_mobile.dart';

class ServiceScreen extends GetView<ServiceController> {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ServiceScreenMobile());
  }
}
