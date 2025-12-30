import 'package:get/get.dart';
import '../views/create_schedule/controller/create_schedule_controller.dart';

class CreateScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateScheduleController>(() => CreateScheduleController());
  }
}
