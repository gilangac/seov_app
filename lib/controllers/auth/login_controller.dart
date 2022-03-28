// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seov_app/controllers/base/service_controller.dart';

class LoginController extends GetxController with ServiceController {
  final _isObscure = true.obs;
  final _isLoading = false.obs;

  final emailFC = TextEditingController();
  final passwordFC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void showPassword() {
    this._isObscure.value = !this._isObscure.value;
  }

  get isObscure => this._isObscure.value;
  get isLoading => this._isLoading.value;

}
