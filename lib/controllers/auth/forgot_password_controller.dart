// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seov_app/controllers/base/service_controller.dart';

class ForgotPasswordController extends GetxController with ServiceController {
  final emailFC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  onSend() async {
    if (this.formKey.currentState!.validate()) {
    }
  }
}
