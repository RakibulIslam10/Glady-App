part of 'otp_screen.dart';

class OtpScreenMobile extends GetView<OtpController> {
  const OtpScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.v20,
            TextWidget(
              "Enter your 6 digit code",
              fontSize: Dimensions.titleLarge * 1.4,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              "Enter the Code We Sent to Your Email",
              fontSize: Dimensions.titleSmall,
              fontWeight: FontWeight.w400,
            ),
            Space.height.v30,

            Pinput(
              autofocus: true,
              length: 6,
              controller: TextEditingController(text: controller.code.value),
              onChanged: (value) => controller.code.value = value,
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
            ),
            Space.height.v30,

            PrimaryButtonWidget(
              title: 'Verify',
              onPressed: () => Get.offAllNamed(Routes.resetPasswordScreen),
            ),
            Space.height.v15,
            Row(
              mainAxisAlignment: mainEnd,
              children: [
                TextWidget(
                  onTap: () => Get.toNamed(Routes.registerScreen),
                  textAlign: TextAlign.end,
                  "Haven’t Received the OTP?",
                  color: CustomColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.titleSmall,
                ),
                TextWidget(
                  onTap: () {},
                  textAlign: TextAlign.end,
                  "  Resend OTP",
                  color: CustomColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
