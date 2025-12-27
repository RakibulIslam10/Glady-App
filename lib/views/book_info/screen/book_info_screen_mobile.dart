part of 'book_info_screen.dart';

class BookInfoScreenMobile extends GetView<BookInfoController> {
  const BookInfoScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Information"),
      bottomNavigationBar: PrimaryButtonWidget(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize,
        ),
        onPressed: () {
          Get.toNamed(Routes.paymentScreen);
        },
        title: 'Book Appointment',
      ),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v15,
            TextWidget("What kind of issue do you need treatment for?"),

            PrimaryInputFieldWidget(
              controller: TextEditingController(),
              hintText: 'Professional Cleaning',
              label: 'visit reason ',
            ),
            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              maxLines: 4,
              controller: TextEditingController(),
              hintText: 'write here details.....',
              label: 'Detail Info (Optional)',
            ),
            TextWidget(
              '** Maximum 180 Character',
              fontSize: Dimensions.titleSmall * 0.8,
              fontWeight: FontWeight.w400,
            ),
            Space.height.v40,
            TextWidget("Attachment"),
            Space.height.v10,
            AttachmentAddWidget(),
          ],
        ),
      ),
    );
  }
}
