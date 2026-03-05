part of 'inbox_screen.dart';

class InboxScreenMobile extends GetView<InboxController> {
   InboxScreenMobile({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.getOldMessages(isPagination: true);
      }
    });

    ever(controller.messagesList, (_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          if (controller.shouldAutoScroll.value) {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
            controller.shouldAutoScroll.value = false;
          } else {
            final isNearBottom = _scrollController.position.pixels < 100;

            if (isNearBottom) {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          }
        }
      });
    });
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            ProfileAvatarWidget(
              size: 40,
              imageUrl: controller.args.avatar,
            ),
            Space.width.v10,
            Column(
              crossAxisAlignment: crossStart,
              mainAxisSize: mainMin,
              children: [
                TextWidget(
                  controller.args.name,
                  fontSize: Dimensions.titleSmall,
                  fontWeight: FontWeight.w600,
                ),
                // ✅ Typing indicator
                Obx(() => controller.isTyping.value
                    ? TextWidget(
                  "typing...",
                  fontSize: Dimensions.labelSmall,
                  color: CustomColors.primary,
                  fontWeight: FontWeight.w400,
                )
                    : const SizedBox.shrink()),
              ],
            ),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.only(left: Dimensions.widthSize),
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF8F8F8),
            ),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: crossStart,
        children: [
          MessageBodyWidget(),
          SelectedImagePreviewWidget(),
          TypeSectionWidget(),
        ],
      ),
    );
  }
}