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

          
          ],
        ),
      ),
    );
  }
}
