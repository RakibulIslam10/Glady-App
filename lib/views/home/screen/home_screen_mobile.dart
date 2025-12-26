part of 'home_screen.dart';

class HomeScreenMobile extends GetView<HomeController> {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        flexibleSpace: MyAppBarWidget(),
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v20,
            SearchHeaderWidget(),
            SliderItemWidget(),
            SectionHeader(
              title: "Daily Wellness Tips",
              onViewAllTap: () {
                Get.toNamed(Routes.tipsScreen);
              },
            ),
            TipsCardWidget(),
            SectionHeader(
              title: "Popular Specialties",
              onViewAllTap: () {
                Get.toNamed(Routes.allCategoryScreen);
              },
            ),
            CategorySectionWidget(),
            SectionHeader(title: "Popular Doctor", onViewAllTap: () {}),
            HomeDoctorCardWidget(),
            BottomBannerWidget(),
          ],
        ),
      ),
    );
  }
}
