// ignore_for_file: constant_identifier_names

part of 'pages.dart';

class AppRoutes {
  static const INITIAL = AppPages.SPLASH;

  static final pages = [
    GetPage(name: _Paths.SPLASH, page: () => const SplashScreen()),
    GetPage(name: _Paths.ONBOARDING, page: () => const OnboardPage()),
    GetPage(name: _Paths.LOGIN, page: () => LoginPage()),
    GetPage(name: _Paths.REGISTER, page: () => RegisterPage()),
    GetPage(name: _Paths.FORGOT_PASSWORD, page: () => ForgotPasswordPage()),
    GetPage(name: _Paths.VENDOR + ':vendor', page: () => VendorPage()),
    GetPage(
        name: _Paths.DETAIL_VENDOR + ':detail-vendor',
        page: () => const DetailVendorPage()),
    GetPage(
        name: _Paths.NAVIGATOR,
        page: () => BottomNavigator(),
        bindings: [
          NavigatorBinding(),
          HomeBinding(),
          OrderBinding(),
          WishlistBinding(),
          ProfileBinding(),
        ],
        transition: Transition.downToUp),
  ];
}
