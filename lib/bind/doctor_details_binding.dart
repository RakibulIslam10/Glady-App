import 'package:get/get.dart';
import '../views/doctor_details/controller/doctor_details_controller.dart';

class DoctorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorDetailsController>(() => DoctorDetailsController());
  }
}
