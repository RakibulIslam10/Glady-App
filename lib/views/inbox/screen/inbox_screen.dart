import 'package:glady/core/widgets/profile_avater_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/inbox_controller.dart';
import '../widget/img_preview.dart';
import '../widget/message_body.dart';
import '../widget/type_section.dart';

part 'inbox_screen_mobile.dart';

class InboxScreen extends GetView<InboxController> {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: InboxScreenMobile());
  }
}
