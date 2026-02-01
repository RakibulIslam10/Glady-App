import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../../home/model/wellness_tips_model.dart';


class TipsController extends GetxController {


  /// Fetch Wellness Tips
  // Pagination
  RxInt currentPage = 1.obs;
  RxInt totalPages = 1.obs;
  RxBool hasMore = true.obs;
  final int limit = 10;

  RxBool isLoadingTips = false.obs;
  RxList<AllTips> wellnessTipsList = <AllTips>[].obs;

  Future<void> fetchWellnessTips() async {
    if (!hasMore.value) return;
    await ApiRequest().get(
      fromJson: WellnessTipModel.fromJson,
      endPoint: ApiEndPoints.wellnessTips,
      isLoading: isLoadingTips,
      isPagination: true,
      page: currentPage.value,
      limit: limit,
      showResponse: true,
      onSuccess: (result) {
        if (currentPage.value == 1) wellnessTipsList.clear();
        wellnessTipsList.addAll(result.allTips);
        totalPages.value = (result.meta.total / limit).ceil();
        hasMore.value = currentPage.value < totalPages.value;
        currentPage.value++;
      },
    );
  }

}
