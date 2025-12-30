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
            DatePickerWidget(
              hint: "Custom Date",
              onDateSelected: (date) {
                controller.selectedDate.value = date;
              },
            ),
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
                  child: Container(
                    padding:
                        Dimensions.defaultHorizontalSize.edgeHorizontal * 0.5,
                    height: Dimensions.inputBoxHeight * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.borderColor,
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.8,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: mainSpaceBet,
                      children: [
                        TextWidget(
                          "Duration",
                          fontSize: Dimensions.titleSmall * 1.2,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                ),
                Space.width.v15,
                Expanded(
                  child: Container(
                    padding:
                        Dimensions.defaultHorizontalSize.edgeHorizontal * 0.5,
                    height: Dimensions.inputBoxHeight * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.borderColor,
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.8,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: mainSpaceBet,
                      children: [
                        TextWidget(
                          "Fee",
                          fontSize: Dimensions.titleSmall * 1.2,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        TextWidget(
                          "\$12",
                          fontSize: Dimensions.titleSmall * 1.2,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Space.height.v25,

            PrimaryButtonWidget(title: 'Continue', onPressed: () {}),

            Space.height.v25,
          ],
        ),
      ),
    );
  }
}
