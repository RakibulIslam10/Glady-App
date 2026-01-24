part of 'forgot_password_screen.dart';

class ForgotPasswordScreenMobile extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreenMobile({super.key});

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
              "Forgot password",
              fontSize: Dimensions.titleLarge * 1.4,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              "We’ll send a verification code to this email to confirm your account",
              fontSize: Dimensions.titleSmall,
              fontWeight: FontWeight.w400,
            ),
            Space.height.v30,

            Form(
              key: controller.fromKey,
              child: Column(
                children: [
                  // Space.height.v30,
                  PrimaryInputFieldWidget(
                    // label: "Email",
                    isEmail: true,
                    controller: controller.emailController,
                    focusNode: controller.emailFocus,
                    hintText: "Enter your email",
                  ),
                  Space.height.betweenInputBox,
                  Space.height.betweenInputBox,

                  Obx(
                    () => PrimaryButtonWidget(
                      title: "Send confirmation ",
                      isLoading: controller.isLoading.value,
                      onPressed: () {
                        if (controller.fromKey.currentState!.validate()) {
                          controller.forgotPasswordProcess();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
