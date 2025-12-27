part of 'doctor_details_screen.dart';

class DoctorDetailsScreenMobile extends GetView<DoctorDetailsController> {
  const DoctorDetailsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PrimaryButtonWidget(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize,
        ),
        title: "Book Appointment ",
        onPressed: () {
          Get.dialog(const BookingDialog(), barrierDismissible: true);
        },
      ),
      appBar: CommonAppBar(title: "Doctor Details"),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            DoctorDetailsCard(
              imageUrl:
                  'https://i.pinimg.com/736x/2a/12/5c/2a125c7aa0d47538b857291fa0901286.jpg',
              name: 'Dr. Elowyn Starcrest',
              specialty: 'Dentist',
              clinicName: 'Central Dental Care',
              rating: 4.7,
              yearsOfExperience: 12,
              startingPrice: 10,
              onTap: () {},
            ),
            Space.height.v15,
            TextWidget("Appointment Consultation Time"),
            Space.height.v15,
            ...List.generate(
              2,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: Dimensions.verticalSize * 0.25,
                ),
                child: AppointmentSectionWidget(
                  days: "Sunday - Friday",
                  time: "4:30 PM - 10:30 PM",
                  price: "\$10",
                  slot: "10 Slot",
                  duration: "20 Minutes",
                ),
              ),
            ),

            Space.height.v15,

            AboutDesWidget(),
            Space.height.v15,

            ServicePartWidget(),
            Space.height.v15,

            ExperiencePartWidget(),

            ReviewRatingPartWidget(),
            Space.height.v15,

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                border: Border.all(
                  color: CustomColors.grayShade.withOpacity(0.15),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
                vertical: Dimensions.verticalSize * 0.8,
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget('Tiago_Felipe'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 16.sp,
                            color: Color(0xFFFF9500),
                          ),
                        ),
                      ),

                      TextWidget("1 Day Ago"),
                    ],
                  ),
                  Space.height.v10,
                  TextWidget(
                    "There are many variations of passage",
                    fontSize: Dimensions.titleLarge * 0.8,
                    maxLines: 1,
                    fontWeight: FontWeight.w600,
                  ),
                  TextWidget(
                    '''the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.''',

                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.titleSmall,
                  ),
                ],
              ),
            ),
            Space.height.v15,

            GestureDetector(
              onTap: () => Get.toNamed(Routes.allReviewScreen),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: Dimensions.verticalSize * 0.6,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
                ),
                child: TextWidget(
                  "Read all reviews",
                  color: CustomColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
