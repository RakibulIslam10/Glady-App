part of 'liked_tips_screen.dart';

class LikedTipsScreenMobile extends GetView<LikedTipsController> {
  const LikedTipsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Liked Tips"),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 2,
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
                      child: Icon(Icons.favorite, color: CustomColors.rejected),
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
