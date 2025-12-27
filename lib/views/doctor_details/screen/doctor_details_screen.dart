import 'package:glady/core/widgets/divider_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../../../widgets/doctor_details_card.dart';
import '../controller/doctor_details_controller.dart';
import '../widget/booking_dialog.dart';
import '../widget/ratings_card.dart';

part 'doctor_details_screen_mobile.dart';
part '../widget/appointment_section_widget.dart';
part '../widget/about_des_widget.dart';
part '../widget/service_part_widget.dart';
part '../widget/experience_part_widget.dart';
part '../widget/review_rating_part_widget.dart';

class DoctorDetailsScreen extends GetView<DoctorDetailsController> {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: DoctorDetailsScreenMobile());
  }
}
