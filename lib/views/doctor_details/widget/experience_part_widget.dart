part of '../screen/doctor_details_screen.dart';

class ExperiencePartWidget extends GetView<DoctorDetailsController> {
  const ExperiencePartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget("Experience"),
        Space.height.v5,
        ...List.generate(
          2,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: Dimensions.heightSize * 2),
            child: Column(
              mainAxisSize: mainMin,
              crossAxisAlignment: crossStart,
              children: [
                TextWidget(
                  'Central Dental care',
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.titleSmall,
                ),
                Space.height.v5,
                TextWidget(
                  'Senior Internal Medicine Consultant',
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.titleSmall,
                ),
                TextWidget(
                  '22 Jan 2021 - 31 Aug 2025 ',
                  fontWeight: FontWeight.w400,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: Dimensions.titleSmall,
                ),
                TextWidget(
                  '4 years',
                  fontWeight: FontWeight.w400,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: Dimensions.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
