import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

class BankDetailsController extends GetxController {
  //new password
  final bankNameController = TextEditingController();
  final isBankNameFocus = FocusNode();

  // password
  final accountNameController = TextEditingController();

  final numberController = TextEditingController();
  final passwordFocus = FocusNode();

  // Change Password APi
  RxBool isLoading = false.obs;

  static final ApiRequest _api = ApiRequest();

  Future<BasicSuccessModel> addBankAccount() async {
    return await _api.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.addBankAccount,
      isLoading: isLoading,
      showSuccessSnackBar: true,
      body: {
        "bankName": bankNameController.text,
        "accountName": accountNameController.text,
        "accountNumber": accountNameController.text,
      },
      onSuccess: (result) {
        Get.back();
      },
    );
  }
}
