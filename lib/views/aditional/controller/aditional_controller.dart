import 'package:glady/core/api/model/basic_success_model.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../model/sceciality_model.dart';

class AditionalController extends GetxController {
  final nameController = TextEditingController();

  RxString specialityId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSpecialist();
  }

  RxList<Specialis> allSpecialist = <Specialis>[].obs;

  RxBool isLoading = false.obs;

  Future<SpecialistsModel> fetchSpecialist() async {
    return ApiRequest().get(
      fromJson: SpecialistsModel.fromJson,
      endPoint: ApiEndPoints.getSpecialties,
      isLoading: isLoading,
      onSuccess: (result) {
        final seen = <String>{};
        final unique = result.data.where((e) => seen.add(e.name)).toList();
        allSpecialist.assignAll(unique);


      },
    );
  }

  RxBool isAdding = false.obs;
  Future<BasicSuccessModel> addSpeciality() async {
    return ApiRequest().post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.createDoctorInfo,
      body: {"currentOrganization": nameController.text, "specialtyId": specialityId.value},
      isLoading: isAdding,
      onSuccess: (result) => Get.toNamed(Routes.uploadDocScreen),
    );
  }
}
