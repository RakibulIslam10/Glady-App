import 'dart:io';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/bottom_image_picker.dart';
import '../controller/book_info_controller.dart';

part 'book_info_screen_mobile.dart';
part '../widget/attachment_add_widget.dart';

class BookInfoScreen extends GetView<BookInfoController> {
  const BookInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: BookInfoScreenMobile());
  }
}
