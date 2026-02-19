import 'package:glady/core/api/end_point/api_end_points.dart';
import 'package:glady/core/api/services/api_request.dart';
import 'package:glady/views/experience/model/all_experience_model.dart';

import '../../../core/utils/basic_import.dart';

class ExperienceController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllExperience();
  }

  RxList<Experiences> experiencesList = <Experiences>[].obs;

  Future<AllExperienceModel> getAllExperience() async {
    return ApiRequest().get(
      fromJson: AllExperienceModel.fromJson,
      endPoint: ApiEndPoints.getAllExperience,
      isLoading: isLoading,
      onSuccess: (result) {
        experiencesList.clear();
        experiencesList.assignAll(result.experiences);
      },
    );
  }
}
