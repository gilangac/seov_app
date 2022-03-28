// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seov_app/routes/pages.dart';
import 'package:seov_app/services/service_preference.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(backgroundColor: Colors.white, body: _body());
  }

  Widget _body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Container(
          height: Get.height,
          constraints: BoxConstraints(
            maxHeight: Get.height,
            maxWidth: Get.width,
          ),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              _illustration(),
              _logo(),
              _textContent(),
              _btnStart()
            ],
          ),
        ),
      ),
    );
  }

  Widget _illustration() {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/seov_illustration.png",
        width: Get.width * 0.7,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _logo() {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/seov_logo2.png",
        width: Get.width * 0.45,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textContent() {
    return const Text(
      "Kami membantumu untuk menemukan vendor - vendor acara yang sesuai dengan kebutuhanmu untuk ikut mensukseskan acaramu",
      textAlign: TextAlign.center,
    );
  }

  Widget _btnStart() {
    return Container(
      width: Get.width / 1.4,
      child: GetPlatform.isIOS
          ? CupertinoButton.filled(
              borderRadius: BorderRadius.circular(12),
              onPressed: () {
                PreferenceService.setStatus("No First");
                Get.offNamed(AppPages.LOGIN);
              },
              child: Text('Mulai'),
            )
          : ElevatedButton(
              onPressed: () {
                PreferenceService.setStatus("No First");
                Get.offNamed(AppPages.LOGIN);
              },
              child: Text('Mulai'),
            ),
    );
  }
}
