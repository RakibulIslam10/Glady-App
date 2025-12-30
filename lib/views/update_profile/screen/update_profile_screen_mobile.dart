part of 'update_profile_screen.dart';

class UpdateProfileScreenMobile extends GetView<UpdateProfileController> {
  const UpdateProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Update Profile"),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (_) => BottomImagePicker(
                      singleImageVariable: (image) {
                        // controller.profileImage.value = image;
                      },
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (AppStorage.isUser == 'USER')
                        ProfileAvatarWidget(
                          size: 100,
                          // imageFile: controller.profileImage.value,
                          imageUrl:
                              'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/Rectangle%202.png',
                        ),

                      if (AppStorage.isUser == 'DOCTOR')
                        ProfileAvatarWidget(
                          size: 100,
                          // imageFile: controller.profileImage.value,
                          imageUrl:
                              'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/Rectangle%202.png',
                        ),
                      Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black38,
                        ),
                        child: Icon(
                          Icons.image_outlined,
                          size: Dimensions.iconSizeLarge * 1.2,
                          color: CustomColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),

                Space.height.betweenInputBox,

                PrimaryInputFieldWidget(
                  controller: controller.nameController,
                  hintText: 'Name',
                  label: 'Name',
                ),

                Space.height.betweenInputBox,

                if (AppStorage.isUser == 'USER')
                  PrimaryInputFieldWidget(
                    controller: controller.emailController,
                    hintText: 'Email',
                    label: 'Email',
                  ),

                Space.height.betweenInputBox,

                PrimaryInputFieldWidget(
                  controller: controller.phoneController,
                  hintText: 'Phone',
                  label: 'Emergency Contact Number',
                ),

                Space.height.betweenInputBox,

                PrimaryInputFieldWidget(
                  controller: controller.dobController,
                  hintText: 'Date of Birth',
                  label: 'Date of Birth',
                ),

                Space.height.betweenInputBox,

                if (AppStorage.isUser != 'USER') ...[
                  _filedDoctorCard(
                    () => Get.toNamed(Routes.aboutScreen),
                    'About',
                  ),
                  Space.height.betweenInputBox,
                  _filedDoctorCard(
                    () => Get.toNamed(Routes.serviceScreen),
                    'Services',
                  ),
                  Space.height.betweenInputBox,
                  Space.height.betweenInputBox,
                  _filedDoctorCard(
                    () => Get.toNamed(Routes.experienceScreen),
                    'Work Experience',
                  ),
                  Space.height.betweenInputBox,
                ],
                Space.height.betweenInputBox,

                PrimaryButtonWidget(title: 'Update', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _filedDoctorCard(void Function()? onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.verticalSize * 0.6,
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
          border: Border.all(color: CustomColors.primary.withOpacity(0.25)),
        ),
        child: Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TextWidget(
              title,
              color: CustomColors.blackColor.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
            Icon(Icons.keyboard_arrow_right, color: CustomColors.primary),
          ],
        ),
      ),
    );
  }
}
