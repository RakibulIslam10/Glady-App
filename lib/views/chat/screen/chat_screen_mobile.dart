part of 'chat_screen.dart';

class ChatScreenMobile extends GetView<ChatController> {
  const ChatScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Chat"),
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
