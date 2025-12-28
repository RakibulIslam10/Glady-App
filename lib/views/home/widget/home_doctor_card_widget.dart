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
        addRepaintBoundaries: true,
        cacheExtent: 500,
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => DoctorCardWidget(
          imageUrl:
              'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/doctorpp.png',
          rating: '4.7',
          name: 'Elowyn Starcrest',
          profession: 'Psychologist',
          onTap: () {
            Get.toNamed(Routes.doctorDetailsScreen);
          },
          hospital: 'Central Dental Care',
        ),
      ),
    );
  }
}
