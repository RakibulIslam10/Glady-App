import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../../../core/widgets/empty_data_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../controller/terms_controller.dart';

part 'terms_screen_mobile.dart';

class TermsScreen extends GetView<TermsController> {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: TermsScreenMobile());
  }
}
