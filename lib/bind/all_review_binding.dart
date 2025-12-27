import 'package:get/get.dart';
import '../views/all_review/controller/all_review_controller.dart';

class AllReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllReviewController>(() => AllReviewController());
  }
}
