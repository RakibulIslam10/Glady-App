import 'package:flutter/cupertino.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/find_controller.dart';

part 'find_screen_mobile.dart';

class FindScreen extends GetView<FindController> {
  const FindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: FindScreenMobile());
  }
}
