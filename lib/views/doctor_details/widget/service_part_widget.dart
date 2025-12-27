part of '../screen/doctor_details_screen.dart';

class ServicePartWidget extends GetView<DoctorDetailsController> {
  const ServicePartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget("Services"),
        Space.height.v5,
        Column(
          crossAxisAlignment: crossStart,
          children: List.generate(
            5,
            (index) => Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              spacing: Dimensions.widthSize * 0.5,
              children: [
                Icon(
                  Icons.circle,
                  color: Color(0xff006C93),

                  size: Dimensions.iconSizeDefault * 0.8,
                ),

                TextWidget('Dental Cleaning', fontWeight: FontWeight.w500),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
