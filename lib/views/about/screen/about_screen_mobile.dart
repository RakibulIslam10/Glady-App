part of 'about_screen.dart';

class AboutScreenMobile extends GetView<AboutController> {
  const AboutScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "About"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v20,
            PrimaryInputFieldWidget(
              label: 'About',
              controller: controller.aboutController,
              hintText: 'Write here...',
              maxLines: 4,
            ),
            TextWidget(
              '** maximum characters 500',
              fontSize: Dimensions.titleSmall * 0.85,
              fontWeight: FontWeight.w400,
              color: CustomColors.disableColor,
            ),

            Space.height.v20,
            Space.height.v20,
            Obx(
              () => PrimaryButtonWidget(
                title: "Save",
                isLoading: controller.isLoading.value,
                onPressed: () => controller.updateAbout(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
