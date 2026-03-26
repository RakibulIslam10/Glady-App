import 'package:glady/core/widgets/loading_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/tips_controller.dart';

part 'tips_screen_mobile.dart';

class TipsScreen extends GetView<TipsController> {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: TipsScreenMobile());
  }
}
