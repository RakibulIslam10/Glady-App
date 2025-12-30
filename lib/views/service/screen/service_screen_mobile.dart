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
              controller: TextEditingController(),
              hintText: 'Name of Service',
            ),

            Space.height.v20,
            Space.height.v20,
            PrimaryButtonWidget(title: "Save", onPressed: () => Get.back()),
          ],
        ),
      ),
    );
  }
}
