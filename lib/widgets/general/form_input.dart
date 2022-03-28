// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:seov_app/constant/colors.dart';

Widget formInput(
    {String? initialValue,
    required String placeholder,
    required controller,
    required TextInputType inputType,
    required TextInputAction inputAction,
    bool secureText = false,
    bool enabled = true,
    required validator}) {
  return Column(
    children: [
      TextFormField(
        initialValue: initialValue,
        controller: controller,
        onChanged: (text) => {},
        keyboardType: inputType,
        textInputAction: inputAction,
        obscureText: secureText,
        enabled: enabled,
        decoration: InputDecoration(
            hintText: placeholder,
            focusedBorder: myfocusborder(),
            // errorBorder: myfocusErrorBorder(),
            focusedErrorBorder: myfocusErrorBorder()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
      ),
    ],
  );
}

OutlineInputBorder myfocusborder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 1,
      ));
}

OutlineInputBorder myfocusErrorBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.red.shade400,
        width: 1,
      ));
}
