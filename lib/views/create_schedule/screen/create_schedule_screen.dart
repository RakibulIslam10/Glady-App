import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/create_schedule_controller.dart';

part 'create_schedule_screen_mobile.dart';

class CreateScheduleScreen extends GetView<CreateScheduleController> {
  const CreateScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: CreateScheduleScreenMobile());
  }
}
