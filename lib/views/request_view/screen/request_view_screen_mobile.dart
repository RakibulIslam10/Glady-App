part of 'request_view_screen.dart';

class RequestViewScreenMobile extends GetView<DoctorHomeController> {
  const RequestViewScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Appointment Request", isBack: false),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultHorizontalSize),
          itemCount:
              controller
                  .dashboardModel
                  .value
                  ?.data
                  .upcomingAppointments
                  .length ??
              0,
          addRepaintBoundaries: true,
          cacheExtent: 500,
          shrinkWrap: true,
          primary: false,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final appointment = controller
                .dashboardModel
                .value!
                .data
                .upcomingAppointments[index];
            return Padding(
              padding: EdgeInsets.only(bottom: Dimensions.heightSize),
              child: RequestCard(
                name: appointment.patientName,
                service: appointment.reasonTitle,
                time: appointment.timeRange,
                status: DateFormat(
                  "dd MMMM",
                ).format(DateTime.parse(appointment.date)),
                buttonTitle: 'View',
                cardOnTap: () {
                  Get.toNamed(Routes.appointmentDetailsScreen);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
