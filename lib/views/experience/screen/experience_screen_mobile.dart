part of 'experience_screen.dart';

class ExperienceScreenMobile extends GetView<ExperienceController> {
  const ExperienceScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Experience"),
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
