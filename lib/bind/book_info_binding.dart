import 'package:get/get.dart';
import '../views/book_info/controller/book_info_controller.dart';

class BookInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookInfoController>(() => BookInfoController());
  }
}
