import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:seov_app/constant/colors.dart';

PreferredSizeWidget appBar(
    {required String title,
    double? elevation,
    bool canBack = true,
    Widget? customLeading,
    bool enableLeading = true,
    List<Widget>? actions,
    PreferredSizeWidget? bottom}) {
  return AppBar(
    centerTitle: true,
    elevation: elevation,
    title: Text(title,
        style: GoogleFonts.poppins(
            color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w600)),
    leading: canBack
        ? customLeading ??
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: GetPlatform.isAndroid
                  ? const Icon(
                      Feather.arrow_left,
                      size: 30,
                    )
                  : const Icon(Feather.chevron_left, size: 30),
            )
        : null,
    automaticallyImplyLeading: enableLeading ? true : false,
    actions: actions,
    bottom: bottom,
  );
}
