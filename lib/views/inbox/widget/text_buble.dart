import '../../../core/utils/basic_import.dart';
import '../controller/inbox_controller.dart';

class TextBubbleWidget extends GetView<InboxController> {
  final int index;

  const TextBubbleWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final msg =
        controller.messagesList[controller.messagesList.length - 1 - index];
    final width = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(maxWidth: width * 0.7),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: Dimensions.widthSize,
      ),
      decoration: BoxDecoration(
        color: msg.isMe ? CustomColors.secondary : Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 2),
          bottomRight: Radius.circular(msg.isMe ? Dimensions.radius * 2 : 0.r),
          bottomLeft: Radius.circular(Dimensions.radius * 2),
        ),
      ),
      child: Text(
        msg.message,
        style: TextStyle(
          color: msg.isMe ? Colors.white : Colors.black87,
          fontSize: 15.sp,
          height: 1.3,
        ),
      ),
    );
  }
}
