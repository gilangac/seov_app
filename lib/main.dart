// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:seov_app/routes/pages.dart';
import 'package:seov_app/services/service_preference.dart';
import 'package:seov_app/themes/light_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await PreferenceService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SEOV',
      theme: lightTheme(context),
      initialRoute: AppRoutes.INITIAL,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
