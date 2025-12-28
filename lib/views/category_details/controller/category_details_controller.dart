import '../../../core/utils/basic_import.dart';
class CategoryDetailsController extends GetxController {



  RxString selectedDate = ''.obs;
  RxString selectedTime = ''.obs;
  RxBool showTimeSlots = false.obs;

  RxInt selectedDateIndex = (-1).obs;
  RxInt selectedTimeIndex = (-1).obs;


  final List<String> datesDayList = [
    'Sun 1 Jan',
    'Mon 5 Feb',
    'Tue 8 Mar',
    'Wed 1 Apr',
    'Thu 4 May',
    'Fri 27 Jun',
    'Sat 14 Jul',
    'Sun 8 Aug',
    'Mon 23 Sep',
    'Tue 20 Oct',
    'Wed 5 Nov',
    'Thu 16 Dec',
  ];

  List<String> timeList = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
  ];







}
