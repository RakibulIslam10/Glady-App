import '../../../core/utils/basic_import.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String time;
  final String status;
  final VoidCallback onPressed;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.time,
    required this.status,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isCancelled = status == 'cancelled';
    final isCompleted = status == 'completed';
    final isOngoing = status == 'ongoing';

    return GestureDetector(
      onTap: () => Get.toNamed(Routes.appointmentDetailsScreen),
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.heightSize * 1.2),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize * 0.6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
          border: Border.all(
            color: isCancelled
                ? CustomColors.rejected
                : CustomColors.grayShade.withOpacity(0.15),
          ),
        ),
        child: Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            // Doctor Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(doctorName, fontSize: Dimensions.titleSmall),
                TextWidget(
                  specialization,
                  fontSize: Dimensions.titleSmall * 0.9,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.blackColor.withOpacity(0.6),
                ),
                Space.height.v10,
                TextWidget(time, fontSize: Dimensions.titleSmall),
                TextWidget(
                  status,
                  fontSize: Dimensions.titleSmall * 0.9,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.blackColor.withOpacity(0.6),
                ),
              ],
            ),

            // Action Button
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultHorizontalSize),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.25,
                    color: isCancelled
                        ? CustomColors.rejected
                        : CustomColors.grayShade.withOpacity(0.15),
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                backgroundColor: isCancelled || isCompleted
                    ? Colors.transparent
                    : CustomColors.primary,
              ),
              onPressed: onPressed,
              icon: TextWidget(
                isCancelled
                    ? 'Delete'
                    : isOngoing
                    ? 'Join'
                    : 'Chat',
                color: isCancelled
                    ? CustomColors.rejected
                    : isCompleted
                    ? CustomColors.primary
                    : isOngoing
                    ? CustomColors.whiteColor
                    : CustomColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
