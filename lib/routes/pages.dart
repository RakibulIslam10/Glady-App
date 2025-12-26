part of 'routes.dart';

class RoutePageList {
  static var list = [
    //Page Route List
GetPage(
    name: Routes.tipsScreen,
    page: () => const TipsScreen(),
    binding: TipsBinding(),
  ),
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.appointmentScreen,
      page: () => const AppointmentScreen(),
      binding: AppointmentBinding(),
    ),
    GetPage(
      name: Routes.findScreen,
      page: () => const FindScreen(),
      binding: FindBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.verificationScreen,
      page: () => const VerificationScreen(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: Routes.navigationScreen,
      page: () => const NavigationScreen(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => const OnboardScreen(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: Routes.uploadDocScreen,
      page: () => const UploadDocScreen(),
      binding: UploadDocBinding(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.otpScreen,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.offlineScreen,
      page: () => const OfflineScreen(),
      binding: OfflineBinding(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
