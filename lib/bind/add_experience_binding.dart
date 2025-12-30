import 'package:get/get.dart';
import '../views/add_experience/controller/add_experience_controller.dart';

class AddExperienceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddExperienceController>(() => AddExperienceController());
  }
}
