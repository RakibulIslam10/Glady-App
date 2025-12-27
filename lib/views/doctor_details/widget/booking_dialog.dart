import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/divider_widget.dart';
import '../controller/doctor_details_controller.dart';

class BookingDialog extends GetView<DoctorDetailsController> {
  const BookingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
                vertical: Dimensions.verticalSize * 0.2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    'Select Date',
                    fontSize: Dimensions.titleLarge * 0.8,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      controller.selectedTime.value = '';
                      controller.selectedDate.value = '';
                      controller.showTimeSlots.value = false;
                      Get.back();
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            DividerWidget(),

            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                  vertical: Dimensions.verticalSize * 0.2,
                ),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2.2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemCount: controller.datesDayList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectedDateIndex.value = index;
                              controller.selectedDate.value =
                                  controller.datesDayList[index];
                              controller.showTimeSlots.value = true;
                              print(controller.selectedDate.value);
                            },
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius,
                            ),
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedDateIndex.value ==
                                          index
                                      ? CustomColors.primary
                                      : Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius,
                                  ),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    controller.datesDayList[index],
                                    fontSize: Dimensions.titleSmall,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        controller.selectedDateIndex.value ==
                                            index
                                        ? Colors.white
                                        : CustomColors.blackColor,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      if (controller.showTimeSlots.value) ...[
                        Space.height.v15,
                        TextWidget(
                          'Select Date',
                          fontSize: Dimensions.titleLarge * 0.8,
                        ),
                        Space.height.v10,
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2.2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                          itemCount: controller.timeList.length,
                          itemBuilder: (context, index) {
                            final time = controller.timeList[index];

                            return InkWell(
                              onTap: () {
                                controller.selectedTimeIndex.value = index;
                                controller.selectedTime.value = time;
                                print(controller.selectedTime.value);
                              },
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius,
                              ),
                              child: Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                    color:
                                        controller.selectedTimeIndex.value ==
                                            index
                                        ? CustomColors.primary
                                        : Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      time,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            controller
                                                    .selectedTimeIndex
                                                    .value ==
                                                index
                                            ? Colors.white
                                            : CustomColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            DividerWidget(),

            PrimaryButtonWidget(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
                vertical: Dimensions.verticalSize,
              ),
              title: 'Continue',
              onPressed: () {
                Get.toNamed(Routes.bookInfoScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
