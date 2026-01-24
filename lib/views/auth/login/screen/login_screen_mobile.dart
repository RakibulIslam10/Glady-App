part of 'login_screen.dart';

class LoginScreenMobile extends GetView<LoginController> {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    log(
      '══════════════════════════════════════════════════════════════════════════════',
    );
    log(
      '═══════════════════ ROLE => ${AppStorage.isUser != "USER" ? 'DOCTOR' : 'USER'} ════════════════════════',
    );
    return Scaffold(
      appBar: CommonAppBar(title: "", isBack: false),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Align(alignment: Alignment.topRight, child: CustomLogoWidget()),
            Space.height.v40,
            TextWidget(
              "Log In",
              fontSize: Dimensions.titleLarge * 1.48,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              "Welcome Back! Glad to See You Again",
              fontSize: Dimensions.titleSmall * 1.2,
              fontWeight: FontWeight.w500,
            ),
            Space.height.btnInputTitleAndBox,
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Space.height.v20,
                  PrimaryInputFieldWidget(
                    // label: "Email",
                    isEmail: true,
                    controller: controller.emailController,
                    focusNode: controller.emailFocus,
                    nextFocusNode: controller.passwordFocus,
                    hintText: "Enter Your Email",
                  ),

                  Space.height.betweenInputBox,
                  PrimaryInputFieldWidget(
                    hintText: "password",
                    // label: "Password",
                    isPassword: true,
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocus,
                    nextFocusNode: null,
                  ),

                  Space.height.v30,

                  /// Button
                  Obx(
                    () => PrimaryButtonWidget(
                      title: 'Log In',
                      isLoading: controller.isLoading.value,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.loginProcess();
                        }
                      },
                    ),
                  ),
                  Space.height.v20,
                  Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      Wrap(
                        children: [
                          TextWidget(
                            onTap: () => Get.toNamed(Routes.registerScreen),
                            textAlign: TextAlign.end,
                            "Don’t have an account?",
                            color: CustomColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.titleSmall,
                          ),
                          TextWidget(
                            onTap: () => Get.toNamed(Routes.registerScreen),
                            textAlign: TextAlign.end,
                            "  Sign up",
                            color: CustomColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.titleSmall,
                          ),
                        ],
                      ),
                      TextWidget(
                        onTap: () => Get.toNamed(Routes.forgotPasswordScreen),
                        textAlign: TextAlign.end,
                        "Forget Password",
                        color: CustomColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.titleSmall,
                      ),
                    ],
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
