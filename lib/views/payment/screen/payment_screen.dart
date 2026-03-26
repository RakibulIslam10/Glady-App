import 'dart:io';

import 'package:glady/views/doctor_details/screen/doctor_details_screen.dart';

import '../../../core/utils/basic_import.dart';
import '../../book_info/controller/book_info_controller.dart';
import '../../doctor_details/controller/doctor_details_controller.dart';
import '../controller/payment_controller.dart';

part 'payment_screen_mobile.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: PaymentScreenMobile());
  }
}
