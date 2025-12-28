part of 'inbox_screen.dart';

class InboxScreenMobile extends GetView<InboxController> {
  const InboxScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        title: Row(
          children: [
            ProfileAvatarWidget(
              size: 40,
              imageUrl:
                  'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/Rectangle%202.png',
            ),
            Space.width.v10,
            TextWidget("Dr. Elowyn Starcrest"),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.only(left: Dimensions.widthSize),
            padding: EdgeInsets.only(left: 8),
            alignment: AlignmentGeometry.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF8F8F8),
            ),
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageBodyWidget(),
          SelectedImagePreviewWidget(),
          TypeSectionWidget(),
        ],
      ),
    );
  }
}
