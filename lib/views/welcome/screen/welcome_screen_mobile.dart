part of 'welcome_screen.dart';

class WelcomeScreenMobile extends GetView<WelcomeController> {
  const WelcomeScreenMobile({super.key});

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
              "welcome back",
              fontSize: Dimensions.titleLarge * 1.4,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              "Your password has been changed continue to login",
              fontSize: Dimensions.titleSmall,
              fontWeight: FontWeight.w400,
            ),
            Space.height.v30,

            Space.height.betweenInputBox,
            PrimaryButtonWidget(
              title: 'Continue',
              onPressed: () => Get.offAllNamed(Routes.loginScreen),
            ),
          ],
        ),
      ),
    );
  }
}
