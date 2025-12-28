import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../../../widgets/doctor_details_card.dart';
import '../../../widgets/section_header.dart';
import '../controller/category_details_controller.dart';

part 'category_details_screen_mobile.dart';

class CategoryDetailsScreen extends GetView<CategoryDetailsController> {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: CategoryDetailsScreenMobile());
  }
}
