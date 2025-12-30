import 'package:glady/core/widgets/custom_drop_down_widget.dart';
import 'package:glady/core/widgets/multi_selection_dropdown.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../../../core/widgets/date_picker_widget.dart';
import '../../../core/widgets/time_picker_widget.dart';
import '../controller/create_schedule_controller.dart';

part 'create_schedule_screen_mobile.dart';

class CreateScheduleScreen extends GetView<CreateScheduleController> {
  const CreateScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: CreateScheduleScreenMobile());
  }
}
