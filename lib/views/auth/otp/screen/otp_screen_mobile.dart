part of 'otp_screen.dart';

class OtpScreenMobile extends GetView<OtpController> {
  const OtpScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Verification"),
      body: SafeArea(child: _bodyWidget()),
    );
  }

  _bodyWidget() {
    return ListView(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      children: [
        Space.height.v20,
        TextWidget(
          "Enter 6-digit code",
          fontSize: Dimensions.titleLarge * 1.4,
          fontWeight: FontWeight.w500,
          padding: Dimensions.heightSize.edgeBottom * 0.5,
        ),
        TextWidget(
          "Please enter the verification code sent to ${Get.find<ForgotPasswordController>().emailController.text}",
          fontSize: Dimensions.titleSmall,
          fontWeight: FontWeight.w400,
        ),

        Space.height.v30,
        Pinput(
          autofocus: true,
          length: 6,
          controller: controller.otpController,
          onChanged: (value) {
            controller.code.value = value;
          },
          onCompleted: (value) {
            controller.code.value = value;
            controller.verifyOtp();
          },
          keyboardType: TextInputType.number,
          autofillHints: const [AutofillHints.oneTimeCode],
          defaultPinTheme: PinTheme(
            width: 55.w,
            height: 55.h,
            textStyle: TextStyle(
              fontSize: Dimensions.titleLarge,
              fontWeight: FontWeight.w500,
              color: CustomColors.primary,
            ),
            decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              border: Border.all(color: CustomColors.disableColor),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 55.w,
            height: 55.h,
            textStyle: TextStyle(
              fontSize: Dimensions.titleLarge,
              fontWeight: FontWeight.w500,
              color: CustomColors.primary,
            ),
            decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              border: Border.all(color: CustomColors.primary, width: 2),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: 55.w,
            height: 55.h,
            textStyle: TextStyle(
              fontSize: Dimensions.titleLarge,
              fontWeight: FontWeight.w500,
              color: CustomColors.primary,
            ),
            decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              border: Border.all(color: CustomColors.primary, width: 2),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
          ),
        ),
        Space.height.v20,
        Space.height.v30,
        Obx(
              () => PrimaryButtonWidget(
            title: 'Verify',
            isLoading: controller.isLoading.value,
            onPressed: () {
              if (controller.otpController.text.isNotEmpty &&
                  controller.otpController.text.length == 6) {
                controller.verifyOtp();
              }
            },
          ),
        ),
        Space.height.v15,
        TimerWidget(
          onResendCode: () {
            controller.resendOtpProcess();
          },
        ),
      ],
    );
  }
}
