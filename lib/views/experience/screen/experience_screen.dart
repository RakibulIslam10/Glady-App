import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/experience_controller.dart';

part 'experience_screen_mobile.dart';

class ExperienceScreen extends GetView<ExperienceController> {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ExperienceScreenMobile());
  }
}
