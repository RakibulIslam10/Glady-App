part of 'update_profile_screen.dart';

class UpdateProfileScreenMobile extends GetView<UpdateProfileController> {
  const UpdateProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "UpdateProfile"),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomImagePicker(
                      singleImageVariable: (image) {
                        return null;
                      },
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ProfileAvatarWidget(
                        size: 100,
                        imageUrl:
                            'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/Rectangle%202.png',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black38,
                        ),
                        height: 100.h,
                        width: 100.w,
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

                PrimaryInputFieldWidget(
                  controller: controller.bloodController,
                  hintText: 'Blood Group',
                  label: 'Blood Group',
                ),
                Space.height.betweenInputBox,
                Space.height.betweenInputBox,
                PrimaryButtonWidget(
                  title: 'Update',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
