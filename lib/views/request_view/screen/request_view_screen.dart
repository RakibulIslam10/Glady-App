import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../../doctor_home/widget/request_card.dart';
import '../controller/request_view_controller.dart';

part 'request_view_screen_mobile.dart';

class RequestViewScreen extends GetView<RequestViewController> {
  const RequestViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: RequestViewScreenMobile());
  }
}
