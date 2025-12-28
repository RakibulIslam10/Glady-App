import '../../../core/utils/basic_import.dart';

class ProfileController extends GetxController {
  List<Map<String, dynamic>> profileList = [
    {
      'title': 'Account Settings',
      'icon': Icons.settings,
      'onTap': Routes.settingScreen,
    },
    {
      'title': 'Contact & Support',
      'icon': Icons.support_agent,
      'onTap': Routes.supportScreen,
    },
    {
      'title': 'Terms & Conditions',
      'icon': Icons.terminal_sharp,
      'onTap': Routes.termsScreen,
    },
    {
      'title': 'Privacy Policy',
      'icon': Icons.policy,
      'onTap': Routes.policyScreen,
    },
    {'title': 'Logout', 'icon': Icons.logout},
  ];
}
