import 'package:glady/core/utils/app_storage.dart';

import '../../../../core/utils/basic_import.dart';

import '../../../../widgets/custom_logo_widget.dart';
import '../controller/doctor_register_controller.dart';

part 'doctor_register_screen_mobile.dart';

class DoctorRegisterScreen extends GetView<DoctorRegisterController> {
  const DoctorRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: DoctorRegisterScreenMobile());
  }
}
