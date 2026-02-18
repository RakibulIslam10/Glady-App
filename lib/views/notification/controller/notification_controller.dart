import 'package:glady/core/api/end_point/api_end_points.dart';
import 'package:glady/core/api/services/api_request.dart';
import 'package:glady/views/notification/model/notifications_model.dart';

import '../../../core/utils/basic_import.dart';

class NotificationController extends GetxController {
  RxList<Notifications> notifications = <Notifications>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllNotifications();
  }

  RxBool isLoading = false.obs;

  Future<NotificationsModel> getAllNotifications() async {
    return ApiRequest().get(
      fromJson: NotificationsModel.fromJson,
      endPoint: ApiEndPoints.notifications,
      isLoading: isLoading,
      onSuccess: (result) {
        notifications.clear();
        notifications.assignAll(result.notifications);
      },
    );
  }
}
