import '../../../core/utils/basic_import.dart';
class DoctorDetailsController extends GetxController {






  final ratings = <RatingData>[
    RatingData(stars: 5, count: 80),
    RatingData(stars: 4, count: 20),
    RatingData(stars: 3, count: 12),
    RatingData(stars: 2, count: 6),
    RatingData(stars: 1, count: 2),
  ].obs;

  int get totalRatings {
    return ratings.fold(0, (sum, rating) => sum + rating.count);
  }

  double getPercentage(int count) {
    return totalRatings > 0 ? (count / totalRatings) : 0.0;
  }


}
class RatingData {
  final int stars;
  final int count;

  RatingData({required this.stars, required this.count});
}