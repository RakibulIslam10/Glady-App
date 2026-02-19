part of 'update_profile_screen.dart';

class UpdateProfileScreenMobile extends GetView<UpdateProfileController> {
  const UpdateProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final existingImageUrl =
        profileController.doctorProfileModel?.data.userId.profileImage ?? '';

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
                        controller.profileImage.value = image;
                      },
                    ),
                  ),
                  child: Obx(
                    () => Stack(
                      alignment: Alignment.center,
                      children: [
                        ProfileAvatarWidget(
                          size: 100,
                          imageFile: controller.profileImage.value != null
                              ? File(controller.profileImage.value!.path)
                              : null,
                          imageUrl: existingImageUrl,
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
                  keyBoardType: TextInputType.number,
                  label: 'Emergency Contact Number',
                ),

                Space.height.betweenInputBox,

                DatePickerWidget(
                  hint: 'Date of Birth',
                  label: 'Date of Birth',
                  onDateSelected: (DateTime date) {
                    controller.selectedDob.value = date;
                    controller.dobController.text = date
                        .toIso8601String()
                        .split('T')
                        .first;
                  },
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
                  _filedDoctorCard(
                    () => Get.toNamed(Routes.experienceScreen),
                    'Work Experience',
                  ),
                  Space.height.betweenInputBox,
                ],

                Space.height.betweenInputBox,

                Obx(
                  () => PrimaryButtonWidget(
                    isLoading: controller.isLoading.value,
                    title: 'Update',
                    onPressed: () {
                      controller.doctorUpdateProfileProcess();
                    },
                  ),
                ),
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
