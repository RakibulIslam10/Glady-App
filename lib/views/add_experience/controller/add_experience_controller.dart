import 'package:glady/views/experience/controller/experience_controller.dart';
import 'package:glady/views/experience/model/all_experience_model.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../model/add_experience_model.dart';

class AddExperienceController extends GetxController {
  final organizationController = TextEditingController();
  final designationController = TextEditingController();

  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;

  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  Experiences? editData;

  bool get isEditMode => editData != null;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Experiences) {
      editData = Get.arguments as Experiences;
      _prefill();
    }
  }



  void _prefill() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      organizationController.text = editData!.organizationName;
      designationController.text = editData!.designation;
      isChecked.value = editData!.isCurrent;
      startDate.value = editData!.startDate;
      if (!editData!.isCurrent) {
        endDate.value = editData!.endDate;
      }
    });
  }

  Future<AddExperienceModel> addExperience() async {
    return ApiRequest().post(
      fromJson: AddExperienceModel.fromJson,
      endPoint: ApiEndPoints.addExperiencesDoctor,
      isLoading: isLoading,
      body: {
        "organizationName": organizationController.text,
        "designation": designationController.text,
        "startDate": startDate.value?.toIso8601String().split('T').first ?? '',
        "endDate": isChecked.value
            ? null
            : endDate.value?.toIso8601String().split('T').first ?? '',
        "isCurrent": isChecked.value,
      },
      onSuccess: (result) {
        Get.close(1);
        Get.find<ExperienceController>().getAllExperience();
      },
    );
  }

  Future<AddExperienceModel> updateExperience() async {
    return ApiRequest().patch(
      fromJson: AddExperienceModel.fromJson,
      endPoint: '${ApiEndPoints.addExperiencesDoctor}/${editData!.id}',
      isLoading: isLoading,
      body: {
        "organizationName": organizationController.text,
        "designation": designationController.text,
        "startDate": startDate.value?.toIso8601String().split('T').first ?? '',
        "endDate": isChecked.value
            ? null
            : endDate.value?.toIso8601String().split('T').first ?? '',
        "isCurrent": isChecked.value,
      },
      onSuccess: (result) {
        Get.close(1);
        Get.find<ExperienceController>().getAllExperience();
      },
    );
  }

  @override
  void onClose() {
    organizationController.dispose();
    designationController.dispose();
    super.onClose();
  }
}
