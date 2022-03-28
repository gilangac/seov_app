// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seov_app/constant/colors.dart';
import 'package:seov_app/helpers/dialog_helper.dart';
import 'package:seov_app/widgets/general/circle_avatar.dart';
import 'package:seov_app/widgets/general/dotted_separoator.dart';

Widget orderCard(List media, index) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 4, spreadRadius: 4)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _headerVendor(index),
            separator(),
            _productInfo(media, index),
            dotSeparator(color: AppColors.grey),
            _totalInfo(),
            dotSeparator(color: AppColors.grey),
            _statusInfo()
          ],
        ),
      ),
    ),
  );
}

Widget separator() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
      color: Colors.grey.shade300,
      height: 1,
      width: Get.width,
    ),
  );
}

Widget _headerVendor(index) {
  return Row(
    children: [
      circleAvatar(
          imageData: "https://randomuser.me/api/portraits/med/women/$index.jpg",
          nameData: "Rumah Sehat",
          size: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          "Rumah Sehat",
          style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500),
        ),
      )
    ],
  );
}

Widget _productInfo(List media, index) {
  return Row(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: Get.height * 0.1,
            width: Get.height * 0.1,
            child: Image.network(
              media[index],
              fit: BoxFit.cover,
            ),
          )),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Paket Hemat - 100 Pax",
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Text(
            "IDR 2.000.000",
            style:
                GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "x 1",
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      )
    ],
  );
}

Widget _totalInfo() {
  return Row(
    children: [
      Text(
        "Total Pembayaran",
        style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500),
      ),
      Spacer(),
      Text(
        "IDR 2.000.000",
        style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600),
      ),
    ],
  );
}

Widget _statusInfo() {
  return Row(
    children: [
      Text(
        "Menunggu Pembayaran",
        style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400),
      ),
      Spacer(),
      GetPlatform.isIOS
          ? CupertinoButton.filled(
              borderRadius: BorderRadius.circular(12),
              onPressed: () {
                DialogHelper.showSuccess();
              },
              child: Text(
                "Bayar",
                style: GoogleFonts.poppins(
                    fontSize: 10, fontWeight: FontWeight.w600),
              ),
            )
          : ElevatedButton(
              onPressed: () {
                DialogHelper.showSuccess();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Bayar",
                  style: GoogleFonts.poppins(
                      fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ),
            ),
    ],
  );
}
