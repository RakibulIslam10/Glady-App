part of '../screen/home_screen.dart';

class TipsCardWidget extends GetView<HomeController> {
  const TipsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.defaultHorizontalSize),
      color: Colors.white,
      height: 140.h,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9, initialPage: 0),
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        allowImplicitScrolling: true,
        padEnds: false,
        pageSnapping: true,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: Dimensions.widthSize),
          decoration: BoxDecoration(
            color: CustomColors.secondary,

            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.radius * 0.6),
              topRight: Radius.circular(Dimensions.radius * 0.6),
              topLeft: Radius.circular(Dimensions.radius * 2),
              bottomRight: Radius.circular(Dimensions.radius * 2),
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(child: SvgPicture.asset(Assets.dummy.bro)),
              Padding(
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
                      fontWeight: FontWeight.w600,
                      color: CustomColors.whiteColor,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.blackColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
                      child: Icon(
                        Icons.favorite_border,
                        size: Dimensions.iconSizeLarge * 0.8,
                        color: CustomColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
