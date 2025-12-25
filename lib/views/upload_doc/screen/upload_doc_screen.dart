import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/upload_doc_controller.dart';

part 'upload_doc_screen_mobile.dart';

class UploadDocScreen extends GetView<UploadDocController> {
  const UploadDocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: UploadDocScreenMobile());
  }
}
