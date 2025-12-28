part of 'payment_screen.dart';

class PaymentScreenMobile extends GetView<PaymentController> {
  const PaymentScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PrimaryButtonWidget(
        title: 'Make payment',
        onPressed: () {
          Get.offAll(
            ConfirmationWidget(
              iconPath: Assets.icons.vector,
              title: "payment successful",
              subtitle:
                  'About this payment information has been sent your email\n Waiting for doctor Confirmation',
            ),
          );
        },

        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize,
        ),
      ),
      appBar: CommonAppBar(title: "Payment"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.v20,
            TextWidget("Dr. Elowyn Starcrest"),
            TextWidget(
              "Dentist",
              fontSize: Dimensions.titleSmall,
              color: CustomColors.blackColor.withOpacity(0.5),
            ),

            Space.height.v20,
            TextWidget(
              "visit reason ",
              fontSize: Dimensions.titleSmall,
              color: CustomColors.blackColor.withOpacity(0.5),
            ),
            TextWidget("Professional Cleaning"),
            Space.height.v10,
            TextWidget(
              '''Detail Info the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.''',
              fontSize: Dimensions.titleSmall,
              color: CustomColors.blackColor.withOpacity(0.8),
            ),
            Space.height.v20,
            AppointmentSectionWidget(
              days: 'Sunday',
              time: '4:30 PM - 4:50 PM',
              price: '\$10',
              slot: '\$10',
              duration: '20 Minutes',
            ),
            Space.height.v20,
            TextWidget("Attachment"),
            Space.height.v10,

            Wrap(
              children: List.generate(controller.attachmentList.length, (
                index,
              ) {
                return Container(
                  margin: EdgeInsets.only(right: Dimensions.widthSize),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColors.disableColor.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                  ),
                  height: 100.h,
                  width: 100.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    child: CachedNetworkImage(
                      imageUrl: controller.attachmentList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
