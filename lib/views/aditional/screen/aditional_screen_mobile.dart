part of 'aditional_screen.dart';

class AditionalScreenMobile extends GetView<AditionalController> {
  const AditionalScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchSpecialist();
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? LoadingWidget()
              : ListView(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Space.height.v20,
                    TextWidget(
                      "Current work \ninformation",
                      fontSize: Dimensions.titleLarge * 1.2,
                    ),
                    Space.height.v20,

                    CustomDropDownWidget(
                      hint: "Select your Specialties",
                      items: controller.allSpecialist.map((e) => e.name).toList(),
                      onChanged: (value) {
                        final found = controller.allSpecialist.firstWhere((e) => e.name == value);
                        controller.specialityId.value = found.id;
                        print(controller.specialityId.value);
                      },
                    ),

                    Space.height.betweenInputBox,
                    PrimaryInputFieldWidget(
                      controller: controller.nameController,
                      hintText: 'Organization Name',
                    ),
                    Space.height.betweenInputBox,
                    Space.height.betweenInputBox,
                    Obx(
                      () => PrimaryButtonWidget(
                        title: 'Continue',
                        isLoading: controller.isAdding.value,
                        onPressed: () => controller.addSpeciality(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
