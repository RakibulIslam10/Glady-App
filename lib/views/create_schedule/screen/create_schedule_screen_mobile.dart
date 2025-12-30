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
          
          ],
        ),
      ),
    );
  }
}