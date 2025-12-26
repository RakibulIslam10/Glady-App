part of '../screen/home_screen.dart';

class BottomBannerWidget extends GetView<HomeController> {
  const BottomBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 290.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(color: CustomColors.primary, height: 160.h),
          Positioned(
            child: Padding(
              padding: Dimensions.verticalSize.edgeBottom,
              child: Image.asset(
                Assets.logo.ssraad.path,
                fit: BoxFit.contain,
                height: 250.h,
                width: double.infinity,
              ),
            ),
          ),

          Positioned(
            left: Dimensions.defaultHorizontalSize * 2.5,
            top: Dimensions.verticalSize * 1.5,
            right: Dimensions.defaultHorizontalSize * 2.5,
            // ✅ width constraint
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
                Space.height.v10,
                TextWidget(
                  "Your small donation can help provide free consultations to those in need. Make a difference today!",
                  maxLines: 3,
                  textOverflow: TextOverflow.ellipsis,
                  color: CustomColors.whiteColor,
                ),
                Space.height.v20,

                Container(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize,
                    vertical: Dimensions.verticalSize * 0.4,
                  ),

                  decoration: BoxDecoration(
                    color: CustomColors.whiteColor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius * 2,
                    ),
                  ),

                  child: TextWidget(
                    "Donate Now",
                    fontWeight: FontWeight.bold,
                    color: CustomColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
