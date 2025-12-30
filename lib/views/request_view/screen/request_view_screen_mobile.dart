part of 'request_view_screen.dart';

class RequestViewScreenMobile extends GetView<RequestViewController> {
  const RequestViewScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Appointment Request",isBack: false,),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
            vertical: Dimensions.verticalSize * 0.8,
          ),
          itemCount: 10,
          addRepaintBoundaries: true,
          cacheExtent: 500,
          shrinkWrap: true,
          primary: true,
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
      ),
    );
  }
}
