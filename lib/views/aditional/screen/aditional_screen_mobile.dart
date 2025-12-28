part of 'aditional_screen.dart';

class AditionalScreenMobile extends GetView<AditionalController> {
  const AditionalScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v20,

            TextWidget(
              "Current work \ninformation",
              fontSize: Dimensions.titleLarge * 1.2,
            ),
            Space.height.v20,

            PrimaryInputFieldWidget(
              controller: controller.nameController,
              hintText: 'Specialties',
            ),
            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              controller: controller.specialityController,
              hintText: 'Organization Name',
            ),
            Space.height.betweenInputBox,
            Space.height.betweenInputBox,
            PrimaryButtonWidget(
              title: 'Continue',
              onPressed: () => Get.toNamed(Routes.uploadDocScreen),
            ),
          ],
        ),
      ),
    );
  }
}
