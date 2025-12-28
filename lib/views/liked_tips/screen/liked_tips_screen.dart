import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/liked_tips_controller.dart';

part 'liked_tips_screen_mobile.dart';

class LikedTipsScreen extends GetView<LikedTipsController> {
  const LikedTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: LikedTipsScreenMobile());
  }
}
