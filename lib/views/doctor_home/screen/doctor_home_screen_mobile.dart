part of 'doctor_home_screen.dart';

class DoctorHomeScreenMobile extends GetView<DoctorHomeController> {
  const DoctorHomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        flexibleSpace: const MyAppBarWidget(),
      ),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.v20,
            const DoctorAppointmentSectionWidget(),
            Space.height.v20,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                border: Border.all(color: CustomColors.borderColor),
              ),
              child: Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultHorizontalSize * 0.5,
                      vertical: Dimensions.verticalSize * 0.5,
                    ),
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        TextWidget(
                          "Booking Request",
                          color: CustomColors.grayShade,
                          fontWeight: FontWeight.w500,
                        ),
                        TextWidget('23'),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 60.h,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultHorizontalSize * 0.5,
                      vertical: Dimensions.verticalSize * 0.5,
                    ),
                    child: Column(
                      crossAxisAlignment: crossEnd,
                      children: [
                        TextWidget(
                          "Booking Request",
                          color: CustomColors.grayShade,
                          fontWeight: FontWeight.w500,
                        ),
                        TextWidget('23'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Space.height.v20,

            ListView.builder(
              itemCount: 5,
              addRepaintBoundaries: true,
              cacheExtent: 500,
              shrinkWrap: true,
              primary: false,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: Dimensions.heightSize),
                child: RequestCard(
                  name: "Luna Kellan",
                  service: "Professional cleaning",
                  time: "10:30 PM - 11:00 PM",
                  status: "23 November",
                  buttonTitle: 'View',
                  cardOnTap: () {
                    Get.toNamed(Routes.appointmentDetailsScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
