import 'package:get/get.dart';
import '../views/request_view/controller/request_view_controller.dart';

class RequestViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestViewController>(() => RequestViewController());
  }
}
