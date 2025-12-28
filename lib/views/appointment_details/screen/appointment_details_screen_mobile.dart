part of 'appointment_details_screen.dart';

class AppointmentDetailsScreenMobile
    extends GetView<AppointmentDetailsController> {
  const AppointmentDetailsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Details"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v15,
            DoctorDetailsCard(
              imageUrl:
                  'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/Rectangle%202.png',
              name: 'Dr. Elowyn Starcrest',
              specialty: 'Dentist',
              clinicName: 'Central Dental Care',
              rating: 4.7,
              yearsOfExperience: 12,
              startingPrice: 10,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
