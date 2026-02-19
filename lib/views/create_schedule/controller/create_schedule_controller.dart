import '../../../core/utils/basic_import.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../schedule/controller/schedule_controller.dart';
import '../../schedule/model/schedule_model.dart';

class CreateScheduleController extends GetxController {
  final feeController = TextEditingController();
  final durationController = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;

  List<String> dayList = [];
  RxBool isLoading = false.obs;

  Future<void> createSchedule() async {
    if (dayList.isEmpty) {
      CustomSnackBar.error('Please select at least one day');
      return;
    }
    if (feeController.text.isEmpty || durationController.text.isEmpty) {
      CustomSnackBar.error('Please fill all fields');
      return;
    }

    await ApiRequest().post(
      fromJson: ScheduleModel.fromJson,
      endPoint: ApiEndPoints.createSchedule,
      isLoading: isLoading,
      showSuccessSnackBar: true,
      body: {
        "days": dayList.map((e) => e.toUpperCase()).toList(),
        "startTime": startTime.value,
        "endTime": endTime.value,
        "slotSizeMinutes": int.tryParse(durationController.text) ?? 0,
        "fee": int.tryParse(feeController.text) ?? 0,
      },
      onSuccess: (result) {
        Get.close(1);
        Get.find<ScheduleController>().getAllSchedule();
      },
    );
  }

  @override
  void onClose() {
    feeController.dispose();
    durationController.dispose();
    super.onClose();
  }
}
