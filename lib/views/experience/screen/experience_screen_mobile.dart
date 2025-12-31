part of 'experience_screen.dart';

class ExperienceScreenMobile extends GetView<ExperienceController> {
  const ExperienceScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: PrimaryButtonWidget(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
            vertical: Dimensions.verticalSize,
          ),
          title: "Add Experience",
          onPressed: () {
            Get.toNamed(Routes.addExperienceScreen);
          },
        ),
      ),
      appBar: CommonAppBar(title: "Experience"),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
            vertical: Dimensions.verticalSize,
          ),
          itemCount: 5,
          addRepaintBoundaries: true,
          cacheExtent: 500,
          shrinkWrap: true,
          primary: true,
          physics: BouncingScrollPhysics(),

          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: Dimensions.heightSize),
            decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
                vertical: Dimensions.verticalSize * 0.5,
              ),
              child: ListTile(
                contentPadding: EdgeInsetsGeometry.zero,
                title: TextWidget(
                  'Central Dental care',
                  fontWeight: FontWeight.w500,
                ),
                subtitle: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    TextWidget(
                      'Senior Internal Medicine Consultant',
                      color: CustomColors.blackColor.withOpacity(0.6),
                      fontSize: Dimensions.titleSmall,
                      fontWeight: FontWeight.w400,
                    ),
                    TextWidget(
                      '22 Jan 2025 - Present 1 years',
                      color: CustomColors.blackColor.withOpacity(0.6),
                      fontSize: Dimensions.titleSmall,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                trailing: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.mode_edit_outline_outlined),
                      color: CustomColors.primary,
                      onPressed: () {
                        Get.toNamed(Routes.addExperienceScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
