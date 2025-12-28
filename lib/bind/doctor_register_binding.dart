import 'package:get/get.dart';
import '../views/doctor_register/controller/doctor_register_controller.dart';

class DoctorRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorRegisterController>(() => DoctorRegisterController());
  }
}
