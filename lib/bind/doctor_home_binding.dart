import 'package:get/get.dart';
import '../views/doctor_home/controller/doctor_home_controller.dart';

class DoctorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorHomeController>(() => DoctorHomeController());
  }
}
