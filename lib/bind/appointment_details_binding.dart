import 'package:get/get.dart';
import '../views/appointment_details/controller/appointment_details_controller.dart';

class AppointmentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppointmentDetailsController>(() => AppointmentDetailsController());
  }
}
