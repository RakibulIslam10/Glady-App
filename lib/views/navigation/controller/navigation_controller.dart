import '../../../core/utils/basic_import.dart';
import '../../appointment/screen/appointment_screen.dart';
import '../../find/screen/find_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../profile/screen/profile_screen.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> bodyScreen = [
    HomeScreen(),
    FindScreen(),
    AppointmentScreen(),
    ProfileScreen(),
  ];

  void changeNavScreen(int index) {
    selectedIndex.value = index;
  }

  void goToHomeNav() {
    changeNavScreen(0);
  }
}
