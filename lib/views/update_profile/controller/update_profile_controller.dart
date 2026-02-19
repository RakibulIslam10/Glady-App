import 'package:glady/core/api/end_point/api_end_points.dart';
import 'package:glady/core/api/services/api_request.dart';
import 'package:glady/views/update_profile/model/update_profile_model.dart';

import '../../../core/utils/basic_import.dart';

import 'dart:io';
import 'package:glady/views/profile/controller/profile_controller.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final bloodController = TextEditingController();
  final addressController = TextEditingController();

  Rx<DateTime?> selectedDob = Rx<DateTime?>(null);

  String initialDateOfBirth = '';

  Rx<XFile?> profileImage = Rx<XFile?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _prefillData();
  }

  void _prefillData() {
    final profileController = Get.find<ProfileController>();
    final data = profileController.doctorProfileModel?.data;
    if (data != null) {
      nameController.text = data.userId.name ?? '';
      phoneController.text = data.userId.phone ?? '';
      initialDateOfBirth = data.dateOfBirth?.substring(0, 10) ?? '';
    }
  }

  Future<UpdateProfileModel> doctorUpdateProfileProcess() async {
    return ApiRequest().multiMultipartRequest(
      reqType: 'PATCH',
      fromJson: UpdateProfileModel.fromJson,
      endPoint: ApiEndPoints.doctorUpdateProfile,
      isLoading: isLoading,
      body: {
        "name": nameController.text,
        "phone": phoneController.text,
        "dateOfBirth": dobController.text,
      },
      showSuccessSnackBar: true,
      onSuccess: (result) {
        Get.find<ProfileController>().getDoctorProfile();
        Get.close(1);
      },
      files: profileImage.value != null
          ? {'image': File(profileImage.value!.path)}
          : {},
    );
  }
}
