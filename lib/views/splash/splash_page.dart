// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seov_app/routes/pages.dart';
import 'package:seov_app/services/service_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SreenScreenState createState() => _SreenScreenState();
}

class _SreenScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _onSplash();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxHeight: Get.height,
          maxWidth: Get.width,
        ),
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                duration: Duration(milliseconds: 1000),
                child: Image.asset(
                  "assets/images/seov_logo.png",
                  width: Get.width * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSplash() {
    final status = PreferenceService.getStatus();
    return Timer(Duration(milliseconds: 2500), () {
      if (status == null || status == "") {
        Get.offNamed(AppPages.ONBOARDING);
      } else {
        Get.offNamed(AppPages.LOGIN);
      }
    });
  }
}
