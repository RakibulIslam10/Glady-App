import 'package:glady/core/widgets/bottom_image_picker.dart';
import 'package:glady/core/widgets/profile_avater_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/update_profile_controller.dart';

part 'update_profile_screen_mobile.dart';

class UpdateProfileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: UpdateProfileScreenMobile());
  }
}
