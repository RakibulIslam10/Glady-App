import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/video_call_controller.dart';

part 'video_call_screen_mobile.dart';

class VideoCallScreen extends GetView<VideoCallController> {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: VideoCallScreenMobile());
  }
}
