import 'package:get/get.dart';
import '../views/liked_tips/controller/liked_tips_controller.dart';

class LikedTipsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LikedTipsController>(() => LikedTipsController());
  }
}
