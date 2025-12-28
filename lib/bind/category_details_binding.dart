import 'package:get/get.dart';
import '../views/category_details/controller/category_details_controller.dart';

class CategoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryDetailsController>(() => CategoryDetailsController());
  }
}
