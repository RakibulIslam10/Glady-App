part of 'notification_screen.dart';

class NotificationScreenMobile extends GetView<NotificationController> {
  const NotificationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Notification"),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
            vertical: Dimensions.verticalSize * 0.5,
          ),
          itemCount: 10,
          addRepaintBoundaries: true,
          cacheExtent: 500,
          shrinkWrap: true,
          primary: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: Dimensions.heightSize),
              decoration: BoxDecoration(
                color: Color(0xffF8F8F8),
                borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                  vertical: Dimensions.verticalSize * 0.25,
                ),
                child: ListTile(
                  contentPadding: EdgeInsetsGeometry.zero,
                  title: TextWidget(
                    'Dr. Elowyn Starcrest', fontWeight: FontWeight.w500,
                  ),
                  subtitle: TextWidget(
                    'Accept your booking request',
                    color: CustomColors.blackColor.withOpacity(0.6),
                    fontSize: Dimensions.titleSmall,

                    fontWeight: FontWeight.w500,
                  ),
                  trailing: TextWidget(
                    '9:30 PM',
                    fontSize: Dimensions.titleSmall,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
