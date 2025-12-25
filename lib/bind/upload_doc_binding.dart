import 'package:get/get.dart';
import '../views/upload_doc/controller/upload_doc_controller.dart';

class UploadDocBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadDocController>(() => UploadDocController());
  }
}
