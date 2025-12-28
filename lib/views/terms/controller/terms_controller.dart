import '../../../core/utils/basic_import.dart';
class TermsController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    // getTermsCondition();
  }

  RxBool isLoading = false.obs;
  String termsDescription = '';

  // Future<TermsModel> getTermsCondition() async {
  //   return ApiRequest.get(
  //     fromJson: TermsModel.fromJson,
  //     endPoint: ApiEndPoints.terms,
  //     isLoading: isLoading,
  //     onSuccess: (result) => termsDescription = result.data.description,
  //   );
  // }









}
