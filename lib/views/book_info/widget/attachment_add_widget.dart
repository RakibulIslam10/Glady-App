part of '../screen/book_info_screen.dart';

class AttachmentAddWidget extends GetView<BookInfoController> {
  const AttachmentAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(controller.attachmentList.length + 1, (index) {
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
    );
  }
}
