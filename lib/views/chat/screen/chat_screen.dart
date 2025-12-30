import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/chat_controller.dart';
import 'chat_screen_mobile.dart';


class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ChatScreenMobile());
  }
}
