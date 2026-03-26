import 'package:glady/core/utils/app_storage.dart';
import 'package:glady/core/widgets/bottom_sheet_dialog_widget.dart';
import 'package:glady/core/widgets/loading_widget.dart';
import 'package:glady/views/profile/widget/profile_box_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/profile_controller.dart';

part 'profile_screen_mobile.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ProfileScreenMobile());
  }
}
