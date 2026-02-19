import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../home/screen/home_screen.dart';
import '../controller/doctor_home_controller.dart';
import '../widget/request_card.dart';

part 'doctor_home_screen_mobile.dart';
part '../widget/doctor_appointment_section_widget.dart';

class DoctorHomeScreen extends GetView<DoctorHomeController> {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: DoctorHomeScreenMobile());
  }
}
