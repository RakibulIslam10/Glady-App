import 'package:get/get.dart';
import '../views/appointment/controller/appointment_controller.dart';

class AppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppointmentController>(() => AppointmentController());
  }
}
