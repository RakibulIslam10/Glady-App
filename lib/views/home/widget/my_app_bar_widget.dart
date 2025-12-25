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
                Container(
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
                Space.width.v10,
                ProfileAvatarWidget(
                  size: 50.h,
                  imageUrl:
                      'https://img.freepik.com/free-photo/front-view-business-woman-suit_23-2148603018.jpg?semt=ais_hybrid&w=740&q=80',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
