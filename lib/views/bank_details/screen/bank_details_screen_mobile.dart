part of 'bank_details_screen.dart';

class BankDetailsScreenMobile extends GetView<BankDetailsController> {
  const BankDetailsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Bank Details"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              hintText: "Bank Name",
              controller: controller.bankNameController,
            ),
            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              hintText: "New password",
              controller: controller.accountNameController,
            ),
            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              hintText: "Confirm password",
              controller: controller.numberController,
            ),
            Space.height.betweenInputBox,
            Space.height.betweenInputBox,
            Obx(
              () => PrimaryButtonWidget(
                title: 'Save',
                isLoading: controller.isLoading.value,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
