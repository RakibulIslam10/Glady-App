import 'package:get/get.dart';
import '../views/all_doctors/controller/all_doctors_controller.dart';

class AllDoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllDoctorsController>(() => AllDoctorsController());
  }
}
