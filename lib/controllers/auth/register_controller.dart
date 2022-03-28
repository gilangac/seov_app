import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seov_app/controllers/base/service_controller.dart';

class RegisterController extends GetxController with ServiceController {
  final _isObscure = true.obs;
  final _isObscure2 = true.obs;

  final nameFC = TextEditingController();
  final emailFC = TextEditingController();
  final phoneFC = TextEditingController();
  final passwordFC = TextEditingController();
  final rePasswordFC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  
  void showPassword() {
    _isObscure.value = !_isObscure.value;
  }

  void showRePassword() {
    _isObscure2.value = !_isObscure2.value;
  }

  get isObscure => _isObscure.value;
  get isObscure2 => _isObscure2.value;
}
