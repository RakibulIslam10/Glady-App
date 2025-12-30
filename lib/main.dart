import 'core/helpers/network_manager.dart';
import 'core/utils/basic_import.dart';
import 'initial.dart';
import 'views/splash/controller/splash_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initial.init();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: CustomColors.backgroundDark,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  final hasInternet = await NetworkManager.hasConnection();
  bool? lastStatus = hasInternet;
  NetworkManager.connectionStream().listen((isConnected) {
    if (lastStatus != null && lastStatus != isConnected) {
      if (!isConnected) {
        Get.toNamed(Routes.offlineScreen);
      } else {
        if (Get.currentRoute == Routes.offlineScreen) {
          // Get.offAllNamed(Routes.splashScreen);
          Get.close(1);
        }
        CustomSnackBar.success(
          title: Strings.connectionRestored,
          message: Strings.youAreBackOnline,
        );
      }
    }
    lastStatus = isConnected;
  });
  PaintingBinding.instance.imageCache.maximumSize = 1000;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 200 << 20;

  runApp(MyApp(hasInternet: hasInternet));
}

class MyApp extends StatelessWidget {
  final bool hasInternet;

  const MyApp({super.key, required this.hasInternet});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: hasInternet ? Routes.splashScreen : Routes.offlineScreen,
        title: Strings.appName,
        theme: Themes.light,
        darkTheme: Themes.dark,
        getPages: Routes.list,
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
        themeMode: ThemeMode.light,
        initialBinding: BindingsBuilder(() {
          Get.lazyPut(() => SplashController());
        }),

        builder: (context, widget) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (ctx) {
                  return Directionality(
                    textDirection: Get.locale?.languageCode == 'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: widget!,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
