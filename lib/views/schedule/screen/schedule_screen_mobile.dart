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
        child: Obx(
              () => controller.isLoading.value
              ? LoadingWidget()
              : controller.scheduleList.isEmpty
              ? EmptyDataWidget()
              : ListView.builder(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: Dimensions.defaultHorizontalSize,
              vertical: Dimensions.verticalSize,
            ),
            itemCount: controller.scheduleList.length,
            addRepaintBoundaries: true,
            cacheExtent: 500,
            shrinkWrap: true,
            primary: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final schedule = controller.scheduleList[index];
              return Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.heightSize * 1.25,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                  border: Border.all(color: CustomColors.borderColor),
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius * 1.5,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize,
                    vertical: Dimensions.verticalSize * 0.2,
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsetsGeometry.zero,
                    title: TextWidget(
                      schedule.dayOfWeek,
                      fontWeight: FontWeight.w500,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        TextWidget(
                          '${schedule.startTime} - ${schedule.endTime}',
                          fontWeight: FontWeight.w400,
                          fontSize: Dimensions.titleSmall,
                          color: CustomColors.blackColor.withOpacity(0.6),
                        ),
                        TextWidget(
                          '\$${schedule.fee}',
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: mainCenter,
                      crossAxisAlignment: crossEnd,
                      children: [
                        TextWidget(
                          '${schedule.slotSizeMinutes} Min',
                          fontWeight: FontWeight.w400,
                          color: CustomColors.blackColor.withOpacity(0.6),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.widthSize * 0.8,
                            vertical: Dimensions.heightSize * 0.2,
                          ),
                          decoration: BoxDecoration(
                            color: schedule.isActive
                                ? CustomColors.primary.withOpacity(0.1)
                                : CustomColors.rejected.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius * 2,
                            ),
                          ),
                          child: TextWidget(
                            schedule.isActive ? 'Active' : 'Inactive',
                            fontSize: Dimensions.labelSmall,
                            color: schedule.isActive
                                ? CustomColors.primary
                                : CustomColors.rejected,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}