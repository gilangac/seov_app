// ignore_for_file: constant_identifier_names

import 'package:get/route_manager.dart';
import 'package:seov_app/bindings/home_binding.dart';
import 'package:seov_app/bindings/navigator_binding.dart';
import 'package:seov_app/bindings/order_binding.dart';
import 'package:seov_app/bindings/profile_binding.dart';
import 'package:seov_app/bindings/whishlist_binding.dart';
import 'package:seov_app/views/bottom_navigator.dart';
import 'package:seov_app/views/home/vendor_page.dart';
import 'package:seov_app/views/login/forgot_password_page.dart';
import 'package:seov_app/views/login/login_page.dart';
import 'package:seov_app/views/register/register_page.dart';
import 'package:seov_app/views/splash/onboard_page.dart';
import 'package:seov_app/views/splash/splash_page.dart';
import 'package:seov_app/views/vendor/detail_vendor_page.dart';

part 'routes.dart';

class AppPages {
  static const SPLASH = _Paths.SPLASH;
  static const NAVIGATOR = _Paths.NAVIGATOR;
  static const HOME = _Paths.HOME;
  static const VENDOR = _Paths.VENDOR;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const DETAIL_INFO = _Paths.DETAIL_INFO;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const DETAIL_VENDOR = _Paths.DETAIL_VENDOR;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const NAVIGATOR = '/';
  static const HOME = '/home';
  static const VENDOR = '/vendor/';
  static const ONBOARDING = '/onboarding';
  static const DETAIL_INFO = '/detail';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const DETAIL_VENDOR = '/detail-vendor/';
}
