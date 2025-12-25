part of 'home_screen.dart';

class HomeScreenMobile extends GetView<HomeController> {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: MyAppBarWidget()),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.v20,
            SearchHeaderWidget(),
            Space.height.v20,

            SizedBox(
              height: 160.h,
              child: PageView.builder(

                onPageChanged: (value) => controller.currentIndex.value =value,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(color: CustomColors.primary,borderRadius: BorderRadius.circular(Dimensions.radius)),
                  child: Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      TextWidget(
                        padding: EdgeInsetsGeometry.only(
                          left: Dimensions.widthSize * 2,
                        ),
                        "WeCure \nYour Health\n Comes First ",
                        fontSize: Dimensions.titleLarge * 1.15,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.whiteColor,
                      ),
                  
                      Image.asset(Assets.dummy.sh.path, height: 130.h),
                    ],
                  ),
                ),
              ),
            ),

            Space.height.v10,

            Row(
              mainAxisAlignment: mainCenter,
              children: List.generate(
                3,
                (index) => Obx(() => Container(
                  margin: Dimensions.widthSize.edgeHorizontal * 0.5,
                  height: 9.h,
                  width: 9.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentIndex.value == index ? CustomColors.primary : CustomColors.disableColor,
                  ),
                ),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
