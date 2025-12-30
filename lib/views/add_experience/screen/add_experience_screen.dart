import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/add_experience_controller.dart';

part 'add_experience_screen_mobile.dart';

class AddExperienceScreen extends GetView<AddExperienceController> {
  const AddExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: AddExperienceScreenMobile());
  }
}
