part of '../screen/doctor_details_screen.dart';

class AboutDesWidget extends GetView<DoctorDetailsController> {
  const AboutDesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisSize: mainMin,
      children: [
        TextWidget("About"),
        Space.height.v10,
        TextWidget(
          '''Dr. Elowyn Starcrest is a compassionate and highly skilled physician known for her patient-centered approach and dedication to delivering exceptional care. 
With a strong commitment to evidence-based medicine, she combines clinical expertise with a warm, thoughtful bedside manner.''',
          fontSize: Dimensions.titleSmall,
          color: CustomColors.blackColor.withOpacity(0.7),
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
