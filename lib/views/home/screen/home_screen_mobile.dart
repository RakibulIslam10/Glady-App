part of 'home_screen.dart';


class HomeScreenMobile extends GetView<HomeController> {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        flexibleSpace: const MyAppBarWidget(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(child: Space.height.v20),
            const SliverToBoxAdapter(child: SearchHeaderWidget()),
            const SliverToBoxAdapter(child: SliderItemWidget()),

            // Daily Wellness Tips Section
            SliverToBoxAdapter(
              child: SectionHeader(
                title: "Daily Wellness Tips",
                onViewAllTap: () => Get.toNamed(Routes.tipsScreen),
              ),
            ),
            const SliverToBoxAdapter(child: TipsCardWidget()),

            // Popular Specialties Section
            SliverToBoxAdapter(
              child: SectionHeader(
                title: "Popular Specialties",
                onViewAllTap: () => Get.toNamed(Routes.allCategoryScreen),
              ),
            ),
            const SliverToBoxAdapter(child: CategorySectionWidget()),

            // Popular Doctor Section
            SliverToBoxAdapter(
              child: SectionHeader(
                title: "Popular Doctor",
                onViewAllTap: () => Get.toNamed(Routes.allDoctorsScreen),
              ),
            ),
            const SliverToBoxAdapter(child: HomeDoctorCardWidget()),

            // Bottom Banner
            const SliverToBoxAdapter(child: BottomBannerWidget()),
          ],
        ),
      ),
    );
  }
}