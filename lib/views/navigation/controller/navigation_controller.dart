import 'package:glady/core/utils/app_storage.dart';
import 'package:glady/views/chat/screen/chat_screen.dart';
import 'package:glady/views/doctor_home/screen/doctor_home_screen.dart';
import 'package:glady/views/request_view/screen/request_view_screen.dart';

import '../../../core/utils/basic_import.dart';
import '../../appointment/screen/appointment_screen.dart';
import '../../find/screen/find_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../profile/screen/profile_screen.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> bodyScreen = [
    AppStorage.isUser == 'USER' ? HomeScreen() : DoctorHomeScreen(),
    AppStorage.isUser == 'USER' ? FindScreen() : RequestViewScreen(),

    AppointmentScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void changeNavScreen(int index) {
    selectedIndex.value = index;
  }

  void goToHomeNav() {
    changeNavScreen(0);
  }
}
