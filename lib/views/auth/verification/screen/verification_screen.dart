import 'package:glady/core/utils/app_storage.dart';
import 'package:glady/core/widgets/timer_widget.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/utils/basic_import.dart';
import '../../register/controller/register_controller.dart';
import '../controller/verification_controller.dart';

part 'verification_screen_mobile.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: VerificationScreenMobile());
  }
}
