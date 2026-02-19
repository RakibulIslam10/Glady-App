import 'package:glady/core/api/end_point/api_end_points.dart';
import 'package:glady/core/api/services/api_request.dart';
import 'package:glady/views/schedule/model/schedule_model.dart';
import '../../../core/utils/basic_import.dart';

class ScheduleController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllSchedule();
    super.onInit();
  }

  RxList<Schedules> scheduleList = <Schedules>[].obs;

  Future<ScheduleModel> getAllSchedule() async {
    return await ApiRequest().get(
      fromJson: ScheduleModel.fromJson,
      endPoint: ApiEndPoints.getALlSchedule,
      isLoading: isLoading,
      onSuccess: (result) {
        scheduleList.clear();
        scheduleList.assignAll(result.data);
      },
    );
  }
}
