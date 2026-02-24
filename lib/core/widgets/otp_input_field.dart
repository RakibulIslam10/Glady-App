import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/basic_import.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key, required this.controller, this.onCompleted});

  final TextEditingController controller;
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: 6,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      autoFocus: true,
      enableActiveFill: true,
      cursorColor: CustomColors.primary,
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: CustomColors.primary,
      ),

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.6),
        fieldHeight: 48.h,
        fieldWidth: 45.w,
        activeFillColor: CustomColors.secondary,
        selectedFillColor: CustomColors.secondary,
        inactiveFillColor: CustomColors.background,
        activeColor: CustomColors.primary,
        selectedColor: CustomColors.primary,
        inactiveColor: CustomColors.secondary,
      ),

      animationDuration: const Duration(milliseconds: 300),

      onChanged: (value) {},

      onCompleted: (value) {
        if (onCompleted != null) {
          onCompleted!(value);
        }
      },

      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
