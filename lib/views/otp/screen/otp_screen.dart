import 'package:pinput/pinput.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/otp_controller.dart';

part 'otp_screen_mobile.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: OtpScreenMobile());
  }
}
