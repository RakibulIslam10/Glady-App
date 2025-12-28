part of 'upload_doc_screen.dart';

class UploadDocScreenMobile extends GetView<UploadDocController> {
  const UploadDocScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.v20,
            TextWidget(
              "Upload documents",
              fontSize: Dimensions.titleLarge * 1.2,
            ),
            TextWidget(
              'The Authority Will Check Your Documents to Verify Your Authenticity.',
              fontSize: Dimensions.titleSmall,
              fontWeight: FontWeight.w400,
            ),

            Space.height.v20,

            Wrap(
              children: List.generate(controller.attachmentList.length + 1, (
                index,
              ) {
                if (controller.attachmentList.length == index) {
                  return GestureDetector(
                    onTap: () {
                      BottomImagePicker.show(
                        multiple: true,
                        multipleImagesVariable: (image) {
                          controller.multipleImages.value = image;
                          // print('✅ Single: ${image?.path}');
                          return image;
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: Dimensions.widthSize),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomColors.disableColor.withOpacity(0.8),
                          width: 1.1,
                        ),
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                      ),
                      height: 100.h,
                      width: 100.w,
                      child: Icon(Icons.add, size: 50.sp),
                    ),
                  );
                }
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
            Space.height.v40,
            PrimaryButtonWidget(
              title: "Continue",
              onPressed: () => Get.offAll(
                ConfirmationWidget(
                  icon: Icon(
                    Icons.access_time_rounded,
                    size: Dimensions.iconSizeLarge * 4,
                    color: CustomColors.primary,
                  ),
                  title: 'Awaiting Verification',
                  subtitle:
                      'The authority will check your documents to verify your authenticity.',
                  onTap: () => Get.offAllNamed(Routes.loginScreen),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
