part of 'create_schedule_screen.dart';

class CreateScheduleScreenMobile extends GetView<CreateScheduleController> {
  const CreateScheduleScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "New Schedule"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v20,
            MultiSelectDropDownWidget(
              hint: 'Day of week',
              items: [
                'Saturday',
                'Sunday',
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
              ],
              onChanged: (value) {
                controller.dayList = value;
              },
            ),
            Space.height.v20,
            Row(
              children: [
                Expanded(
                  child: TimePickerWidget(
                    hint: "Starting Time",
                    onTimeSelected: (time) {
                      controller.startTime.value = time;
                    },
                  ),
                ),
                Space.width.v15,
                Expanded(
                  child: TimePickerWidget(
                    hint: "Ending Time",
                    onTimeSelected: (time) {
                      controller.endTime.value = time;
                    },
                  ),
                ),
              ],
            ),
            Space.height.v20,
            Row(
              children: [
                Expanded(
                  child: PrimaryInputFieldWidget(
                    controller: controller.durationController,
                    hintText: 'Duration (min)',
                    label: 'Duration',
                  ),
                ),
                Space.width.v15,
                Expanded(
                  child: PrimaryInputFieldWidget(
                    controller: controller.feeController,
                    hintText: 'Fee (\$)',
                    label: 'Fee',

                    keyBoardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Space.height.v25,
            Obx(
              () => PrimaryButtonWidget(
                isLoading: controller.isLoading.value,
                title: 'Continue',
                onPressed: () => controller.createSchedule(),
              ),
            ),
            Space.height.v25,
          ],
        ),
      ),
    );
  }
}
