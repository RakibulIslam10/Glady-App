part of 'all_doctors_screen.dart';

class AllDoctorsScreenMobile extends GetView<AllDoctorsController> {
  const AllDoctorsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "All Doctors"),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize * 0.25,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: Dimensions.heightSize,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return DoctorCardWidget(
            imageUrl:
                'https://i.pinimg.com/736x/2a/12/5c/2a125c7aa0d47538b857291fa0901286.jpg',
            rating: '4.7',
            name: 'Elowyn Starcrest',
            profession: 'Psychologist',
            hospital: 'Central Dental Care',
            onTap: () {},
          );
        },
      ),
    );
  }
}
