// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seov_app/constant/colors.dart';
import 'package:seov_app/routes/pages.dart';
import 'package:seov_app/views/vendor/detail_vendor_page.dart';
import 'package:seov_app/widgets/general/circle_avatar.dart';

Widget vendorCard(List vendor, index) {
  return FadeInDown(
    duration: Duration(milliseconds: 500),
    child: GestureDetector(
      onTap: () {
        Get.to(DetailVendorPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, blurRadius: 20, spreadRadius: 0)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    circleAvatar(
                        imageData:
                            "https://randomuser.me/api/portraits/med/women/$index.jpg",
                        nameData: "Rumah Sehat",
                        size: 25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rumah Sehat",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                          Text("Catering - Madiun",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              )),
                          _rating()
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: Get.height * 0.2,
                    width: Get.width,
                    child: Image.network(
                      vendor[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _rating() {
  return Row(
    children: const [
      Icon(
        Icons.star,
        color: AppColors.primaryColor,
        size: 10,
      ),
      Icon(
        Icons.star,
        color: AppColors.primaryColor,
        size: 10,
      ),
      Icon(
        Icons.star,
        color: AppColors.primaryColor,
        size: 10,
      ),
      Icon(
        Icons.star,
        color: AppColors.primaryColor,
        size: 10,
      ),
      Icon(
        Icons.star,
        color: AppColors.grey,
        size: 10,
      ),
    ],
  );
}
