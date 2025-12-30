part of 'schedule_screen.dart';

class ScheduleScreenMobile extends GetView<ScheduleController> {
  const ScheduleScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Manage Schedule"),
      floatingActionButton: Container(
        padding: EdgeInsets.all(Dimensions.radius * 0.4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,

          color: CustomColors.primary,
        ),
        child: IconButton(
          onPressed: () {
            Get.toNamed(Routes.createScheduleScreen);
          },
          icon: Icon(
            Icons.add,
            size: Dimensions.iconSizeLarge * 1.4,
            color: CustomColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
            vertical: Dimensions.verticalSize,
          ),
          itemCount: 3,
          addRepaintBoundaries: true,
          cacheExtent: 500,
          shrinkWrap: true,
          primary: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: Dimensions.heightSize * 1.25),
            decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              border: Border.all(color: CustomColors.borderColor),
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
                vertical: Dimensions.verticalSize * 0.2,
              ),
              child: ListTile(
                contentPadding: EdgeInsetsGeometry.zero,
                title: TextWidget('Dr. Elowyn Starcrest',fontWeight: FontWeight.w500,),
                subtitle: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    TextWidget(
                      '4:30 PM - 10:30 PM',
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.titleSmall,
                      color: CustomColors.blackColor.withOpacity(0.6),
                    ),

                    TextWidget('\$10',fontWeight: FontWeight.w500,),
                  ],
                ),
                trailing: Column(
                  children: [
                    TextWidget('10 Slot'),
                    TextWidget(
                      '20 Minutes',

                      fontWeight: FontWeight.w400,
                      color: CustomColors.blackColor.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
