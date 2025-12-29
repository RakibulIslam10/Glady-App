part of '../screen/doctor_home_screen.dart';

class DoctorAppointmentSectionWidget extends StatelessWidget {
  const DoctorAppointmentSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
        vertical: Dimensions.verticalSize * 0.8,
      ),
      decoration: BoxDecoration(
        color: CustomColors.offWhite,
        border: Border.all(color: CustomColors.borderColor),
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget("Appointment", fontWeight: FontWeight.w500),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.swap_calls_sharp),
                  TextWidget(
                    " Manage",
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          Space.height.v15,

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize * 1.2,
                  vertical: Dimensions.verticalSize * 0.6,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.primary,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Sunday",
                      color: CustomColors.whiteColor,
                      fontSize: Dimensions.titleLarge * 0.9,
                      fontWeight: FontWeight.w500,
                    ),
                    TextWidget(
                      "12 Nov",
                      color: CustomColors.whiteColor,
                      fontSize: Dimensions.titleSmall,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 12.h),
                    TextWidget(
                      "10",
                      color: CustomColors.whiteColor,
                      fontSize: Dimensions.titleLarge * 1.2,
                    ),
                    TextWidget(
                      "Slot",
                      color: CustomColors.whiteColor,
                      fontSize: Dimensions.titleSmall,
                    ),
                  ],
                ),
              ),

              Space.width.v10,

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  Dimensions.defaultHorizontalSize * 0.8,
                              vertical: Dimensions.verticalSize * 0.6,
                            ),
                            decoration: BoxDecoration(
                              color: CustomColors.whiteColor,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius * 0.6,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  "Starting",
                                  color: CustomColors.blackColor.withOpacity(
                                    0.5,
                                  ),
                                  fontSize: Dimensions.titleSmall * 0.9,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 2.h),
                                TextWidget(
                                  "10:30 PM",
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),

                        Space.width.v10,

                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  Dimensions.defaultHorizontalSize * 0.8,
                              vertical: Dimensions.verticalSize * 0.6,
                            ),
                            decoration: BoxDecoration(
                              color: CustomColors.whiteColor,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius * 0.6,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  "Ending",
                                  color: CustomColors.blackColor.withOpacity(
                                    0.5,
                                  ),
                                  fontSize: Dimensions.titleSmall * 0.9,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 2.h),
                                TextWidget(
                                  "12:00 PM",
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Space.height.v10,

                    // Next Schedule
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultHorizontalSize * 0.8,
                        vertical: Dimensions.verticalSize * 0.6,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColors.whiteColor,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius * 0.6,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            "Next Schedule",
                            color: CustomColors.blackColor.withOpacity(0.5),
                            fontSize: Dimensions.titleSmall * 0.95,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 2.h),
                          TextWidget(
                            "11:00 PM - 11:30 PM",
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Space.height.v15,

          RequestCard(
            name: "Luna Kellan",
            service: "Professional cleaning",
            time: "10:30 PM - 11:00 PM",
            status: "Ongoing",
            buttonTitle: 'Join',
            onTap: () {
            },
          ),

        ],
      ),
    );
  }
}
