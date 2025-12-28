import 'package:get/get.dart';
import '../views/bank_details/controller/bank_details_controller.dart';

class BankDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankDetailsController>(() => BankDetailsController());
  }
}
