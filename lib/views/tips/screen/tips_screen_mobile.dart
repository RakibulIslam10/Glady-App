part of 'tips_screen.dart';

class TipsScreenMobile extends GetView<TipsController> {
  const TipsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Daily Health Tips",
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.likedTipsScreen),
            icon: Icon(Icons.favorite_border, color: CustomColors.rejected),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
            vertical: Dimensions.verticalSize,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: Dimensions.heightSize),
              decoration: BoxDecoration(
                color: Color(0xffF8F8F8),
                borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                  vertical: Dimensions.verticalSize * 0.7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      "Drink water regularly throughout the day to keep your body energized and functioning smoothly.",
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.disableColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
                      child: Icon(
                        Icons.favorite_border,
                        color: CustomColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
