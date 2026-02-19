import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../../../core/widgets/empty_data_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../controller/schedule_controller.dart';

part 'schedule_screen_mobile.dart';

class ScheduleScreen extends GetView<ScheduleController> {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ScheduleScreenMobile());
  }
}
