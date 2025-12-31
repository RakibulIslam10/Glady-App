part of '../screen/home_screen.dart';

class BottomBannerWidget extends StatelessWidget {
  const BottomBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: Stack(
        children: [
          // Background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 160.h,
            child: Container(color: Color(0xff0386B5)),
          ),

          // Image
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                  vertical: Dimensions.verticalSize,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.primary,
                  border: Border.all(color: CustomColors.whiteColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
              ),
            ),
          ),

          // Content
          Positioned(
            left: Dimensions.defaultHorizontalSize * 2.5,
            top: Dimensions.verticalSize * 1.5,
            right: Dimensions.defaultHorizontalSize * 2.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  "Be a Healthcare Hero",
                  fontWeight: FontWeight.bold,
                  color: CustomColors.whiteColor,
                  fontSize: Dimensions.titleLarge,
                ),
                SizedBox(height: 10.h),
                TextWidget(
                  "Your small donation can help provide free consultations to those in need. Make a difference today!",
                  maxLines: 3,
                  textOverflow: TextOverflow.ellipsis,
                  color: CustomColors.whiteColor,
                ),
                SizedBox(height: 20.h),
                const _DonateButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DonateButton extends StatelessWidget {
  const _DonateButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
        vertical: Dimensions.verticalSize * 0.4,
      ),
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: TextWidget(
        "Donate Now",
        fontWeight: FontWeight.bold,
        color: CustomColors.primary,
      ),
    );
  }
}
