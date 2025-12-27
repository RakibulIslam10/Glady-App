import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/common_app_bar.dart';
import '../controller/book_info_controller.dart';

part 'book_info_screen_mobile.dart';

class BookInfoScreen extends GetView<BookInfoController> {
  const BookInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: BookInfoScreenMobile());
  }
}
