import '../../../core/utils/basic_import.dart';

class ProfileController extends GetxController {
  List<Map<String, dynamic>> profileList = [
    {'title': 'Account Settings', 'icon': Icons.settings},
    {'title': 'Contact & Support', 'icon': Icons.support_agent},
    {'title': 'Terms & Conditions', 'icon': Icons.terminal_sharp},
    {'title': 'Privacy Policy', 'icon': Icons.policy},
    {'title': 'Logout', 'icon': Icons.logout},
  ];
}
