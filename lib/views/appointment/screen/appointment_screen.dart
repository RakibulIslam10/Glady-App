import 'package:glady/core/widgets/bottom_sheet_dialog_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/appointment_controller.dart';
import '../widget/appointment_card.dart';

part 'appointment_screen_mobile.dart';

class AppointmentScreen extends GetView<AppointmentController> {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: AppointmentScreenMobile());
  }
}
