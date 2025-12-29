import '../../../core/utils/basic_import.dart';
class HomeController extends GetxController {

RxInt currentIndex = 0.obs;
RxBool isLoading = true.obs;


@override
void onInit() {
  super.onInit();
  _precacheAssets();
}

Future<void> _precacheAssets() async {
  try {
    // SVG precache
    final loader = SvgAssetLoader(Assets.dummy.bro);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
          () => loader.loadBytes(null),
    );

    // Image precache
    await precacheImage(
      AssetImage(Assets.logo.ssraad.path),
      Get.context!,
    );
  } catch (e) {
    print('Error precaching: $e');
  }
}







}
