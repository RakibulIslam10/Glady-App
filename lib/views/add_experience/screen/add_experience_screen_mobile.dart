part of 'add_experience_screen.dart';

class AddExperienceScreenMobile extends GetView<AddExperienceController> {
  const AddExperienceScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Add Experience"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v20,
            PrimaryInputFieldWidget(
              label: 'Organization Name',
              controller: TextEditingController(),
              hintText: 'Organization Name',
            ),
            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              label: 'Designation',
              controller: TextEditingController(),
              hintText: 'Designation',
            ),
            Space.height.betweenInputBox,
            TextWidget(
              padding: EdgeInsetsGeometry.only(
                bottom: Dimensions.spaceBetweenInputTitleAndBox * 0.6,
              ),
              "Starting Date",
              fontSize: Dimensions.titleSmall,
              fontWeight: FontWeight.w500,
              color: CustomColors.blackColor,
            ),
            DatePickerWidget(label: 'Starting Date', onDateSelected: (date) {}),
            Space.height.v10,
            Row(
              children: [
                TextWidget("Current working here"),
                Space.width.v10,
                Container(
                  height: 18.h,
                  width: 18.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius * 0.4,
                    ),
                    border: Border.all(
                      color: CustomColors.blackColor,
                      width: 1.2.w,
                    ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: CustomColors.blackColor.withOpacity(0.7),
                    size: 16.sp,
                  ),
                ),
              ],
            ),

            Space.height.betweenInputBox,

            TextWidget(
              padding: EdgeInsetsGeometry.only(
                bottom: Dimensions.spaceBetweenInputTitleAndBox * 0.6,
              ),
              "Ending Date",
              fontSize: Dimensions.titleSmall,
              fontWeight: FontWeight.w500,
              color: CustomColors.blackColor,
            ),
            DatePickerWidget(label: 'Ending Date', onDateSelected: (date) {}),

            Space.height.v40,

            PrimaryButtonWidget(title: "Save", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
