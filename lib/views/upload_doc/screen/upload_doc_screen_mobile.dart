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

            Obx(() => Wrap(
              children: List.generate(controller.multipleImages.length + 1, (index) {
                if (index == controller.multipleImages.length) {
                  return GestureDetector(
                    onTap: () {
                      BottomImagePicker.show(
                        multiple: true,
                        multipleImagesVariable: (image) {
                          controller.multipleImages.value = image;
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
                    child: Image.file(
                      File(controller.multipleImages[index].path),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            )),
            Space.height.v40,
 Obx(() =>
     PrimaryButtonWidget(
         isLoading: controller.isLoading.value,
         title: "Continue",
         onPressed: () => controller.uploadFileDoc()
     ),)
          ],
        ),
      ),
    );
  }
}
