part of 'navigation_screen.dart';


class NavigationScreenMobile extends GetView<NavigationController> {
  const NavigationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.bodyScreen[controller.selectedIndex.value]),
      bottomNavigationBar: SizedBox(child: BottomNavWidget()),
    );
  }
}
