part of 'book_info_screen.dart';

class BookInfoScreenMobile extends GetView<BookInfoController> {
  const BookInfoScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "BookInfo"),
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
