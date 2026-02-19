part of 'service_screen.dart';

class ServiceScreenMobile extends GetView<ServiceController> {
  const ServiceScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Service"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v20,
            PrimaryInputFieldWidget(
              label: 'Service',
              controller: controller.serviceNameController,
              hintText: 'Name of Service',
            ),

            Space.height.v20,
            Space.height.v20,
            Obx(
              () => PrimaryButtonWidget(
                isLoading: controller.isLoading.value,
                title: "Save",
                onPressed: () => controller.addService(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
