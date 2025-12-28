import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/profile_avater_widget.dart';
import '../../../widgets/custom_logo_widget.dart';

class ProfileBoxWidget extends StatelessWidget {
  const ProfileBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
        vertical: Dimensions.verticalSize * 0.5,
      ),
      decoration: BoxDecoration(
        color: CustomColors.offWhite,
        borderRadius: BorderRadius.circular(Dimensions.radius),
        border: Border.all(color: CustomColors.borderColor),
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              CustomLogoWidget(size: 40.h),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize * 0.5,
                    vertical: Dimensions.verticalSize * 0.25,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                    side: BorderSide(color: CustomColors.primary),
                  ),
                ),
                onPressed: () {},
                child: TextWidget(
                  'ID : 052415',
                  fontSize: Dimensions.titleSmall,
                  color: CustomColors.primary,
                ),
              ),
            ],
          ),

          ProfileAvatarWidget(
            imageUrl:
                'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/Rectangle%202.png',

            size: 100,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: Dimensions.widthSize * 0.8,
            children: [
              TextWidget("Luna Kellan"),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize * 0.8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius * 1.5,
                    ),
                    side: BorderSide(color: CustomColors.primary),
                  ),
                ),
                onPressed: () {},
                child: TextWidget(
                  'A+',
                  fontSize: Dimensions.titleSmall * 0.9,
                  color: CustomColors.primary,
                ),
              ),
            ],
          ),
          TextWidget(
            '10- aug- 1986',
            fontSize: Dimensions.titleSmall,
            color: Colors.black.withOpacity(0.7),
          ),
          TextWidget(
            '+1154521 854854',
            fontSize: Dimensions.titleSmall,
            color: Colors.black.withOpacity(0.7),
          ),

          Space.height.v20,
          Column(
            crossAxisAlignment: crossStart,
            children: [
              TextWidget('Allergies'),

              Space.height.v10,
              Wrap(
                children: List.generate(
                  4,
                  (index) => TextWidget(
                    padding: EdgeInsetsGeometry.only(
                      right: Dimensions.widthSize * 2,
                      bottom: Dimensions.heightSize,
                    ),
                    'food allergies',
                    fontSize: Dimensions.titleSmall,
                    color: CustomColors.grayShade,
                  ),
                ),
              ),
              Space.height.v20,
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(Routes.updateProfileScreen),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CustomColors.primary,

                          borderRadius: BorderRadius.circular(
                            Dimensions.radius,
                          ),
                        ),

                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: Dimensions.defaultHorizontalSize * 2,
                          vertical: Dimensions.verticalSize * 0.4,
                        ),
                        child: TextWidget(
                          'Edit Profile',
                          color: CustomColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Space.width.v10,
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: CustomColors.whiteColor,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultHorizontalSize,
                        vertical: Dimensions.verticalSize * 0.4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                        side: BorderSide(color: CustomColors.borderColor),
                      ),
                    ),
                    onPressed: () {},
                    child: TextWidget("QR CODE", color: CustomColors.primary),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
