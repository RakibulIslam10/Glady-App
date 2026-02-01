part of 'reset_password_screen.dart';

class ResetPasswordScreenMobile extends GetView<ResetPasswordController> {
  const ResetPasswordScreenMobile({super.key});

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
              "Create New Password",
              fontSize: Dimensions.titleLarge * 1.4,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              "Create Your New Password",
              fontSize: Dimensions.titleSmall,
              fontWeight: FontWeight.w400,
            ),
            Space.height.v30,

            PrimaryInputFieldWidget(
              hintText: "New password",
              // label: "Password",
              isPassword: true,
              controller: controller.passwordController,
              focusNode: controller.passwordFocus,
              nextFocusNode: controller.confirmPasswordFocus,
            ),
            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              hintText: "Confirm password",
              // label: "Confirm Password",
              isPassword: true,
              controller: controller.passConfirmController,
              focusNode: controller.confirmPasswordFocus,
              nextFocusNode: null,
              confirmWith:
                  controller.passwordController, // only checks matching
            ),
            Space.height.betweenInputBox,
            Space.height.v30,
            Obx(
              () => PrimaryButtonWidget(
                title: 'Change password',
                isLoading: controller.isLoading.value,
                onPressed: () => controller.resetPasswordProcess(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
