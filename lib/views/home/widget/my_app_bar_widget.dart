part of '../screen/home_screen.dart';

class MyAppBarWidget extends GetView<HomeController> {
  const MyAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize * 0.1,
        ),
        child: Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            CustomLogoWidget(),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.notificationScreen),
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.disableColor.withOpacity(0.2),
                      ),
                      shape: BoxShape.circle,
                      color: CustomColors.whiteColor,
                    ),

                    child: Icon(
                      Icons.notifications_active_outlined,
                      color: CustomColors.primary,
                      size: Dimensions.iconSizeLarge,
                    ),
                  ),
                ),
                Space.width.v10,
                ProfileAvatarWidget(
                  size: 50.h,
                  imageUrl:'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/doctorpp.png'
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
