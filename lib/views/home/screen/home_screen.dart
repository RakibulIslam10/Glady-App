import 'package:glady/core/widgets/profile_avater_widget.dart';
import 'package:glady/widgets/custom_logo_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/home_controller.dart';

part 'home_screen_mobile.dart';
part '../widget/my_app_bar_widget.dart';
part '../widget/search_header_widget.dart';
part '../widget/slider_item_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: HomeScreenMobile());
  }
}
