import 'package:get/get.dart';
import '../views/experience/controller/experience_controller.dart';

class ExperienceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExperienceController>(() => ExperienceController());
  }
}
