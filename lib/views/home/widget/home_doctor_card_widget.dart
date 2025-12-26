part of '../screen/home_screen.dart';

class HomeDoctorCardWidget extends GetView<HomeController> {
  const HomeDoctorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.defaultHorizontalSize),
      height: 240.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => DoctorCardWidget(
          imageUrl:
              'https://i.pinimg.com/736x/2a/12/5c/2a125c7aa0d47538b857291fa0901286.jpg',
          rating: '4.7',
          name: 'Elowyn Starcrest',
          profession: 'Psychologist',
          hospital: 'Central Dental Care',
        ),
      ),
    );
  }
}
