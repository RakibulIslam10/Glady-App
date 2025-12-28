part of 'setting_screen.dart';

class SettingScreenMobile extends GetView<SettingController> {
  const SettingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Account Setting'),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.v10,
            _buildSectionCard(
              Icons.lock,
              'Change Password',
              () => Get.toNamed(Routes.changePasswordScreen),
              false,
            ),
            _buildSectionCard(
              Icons.person,
              'Bank Account',
              () => Get.toNamed(Routes.bankDetailsScreen),
              false,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildSectionCard(
    IconData icon,
    String title,
    void Function()? onTap,
    bool isRed,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.heightSize),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.heightSize * 1.2,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          border: Border.all(color: CustomColors.borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: isRed ? CustomColors.rejected : CustomColors.primary,
                  ),
                  SizedBox(width: Dimensions.defaultHorizontalSize * 0.5),
                  Expanded(
                    child: TextWidget(
                      title,
                      fontSize: Dimensions.titleSmall * 1.1,
                      color: isRed
                          ? CustomColors.rejected
                          : CustomColors.blackColor,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: isRed ? CustomColors.rejected : CustomColors.primary,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
