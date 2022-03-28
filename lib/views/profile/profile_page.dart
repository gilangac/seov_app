// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seov_app/constant/colors.dart';
import 'package:seov_app/helpers/dialog_helper.dart';
import 'package:seov_app/routes/pages.dart';
import 'package:seov_app/widgets/general/app_bar.dart';
import 'package:seov_app/widgets/general/circle_avatar.dart';
import 'package:seov_app/widgets/general/dotted_separoator.dart';
import 'package:seov_app/widgets/order/order_card.dart';

final List<String> imgList = [
  'https://2.bp.blogspot.com/-k6iYLSevbRg/XGz4Jtew64I/AAAAAAAAAL8/eZYg0VcaRJgNeIIUAyl-2skI49VampYPgCEwYBhgL/s1600/dekorasi%2Blamaran%2Bjakarta%2Bbekasi%2B%25284%2529.jpg',
  'https://jasacampaign.com/wp-content/uploads/2018/07/2.jpg',
  'https://lyfwell.com/wp-content/uploads/2020/06/biaya-catering-pernikahan-2.jpg',
  'https://ik.imagekit.io/carro/jualo/original/23227923/sewa-alat-pesta-dan-e-vendor-perlengkapan-acara-23227923.jpg?v=1579870610',
  'http://alienco.net/wp-content/uploads/2015/02/puput1-19.jpg',
  'https://i1.wp.com/akadmu.com/wp-content/uploads/2019/03/Photo-shared-by-Ikko-Make-Up.jpg?resize=640%2C427&ssl=1'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Image.network(item, fit: BoxFit.cover, width: 1000.0)),
          ),
        ))
    .toList();

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  PreferredSizeWidget _appBar() {
    return appBar(
      title: "Profil",
      canBack: false,
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 200,
            width: Get.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFF59488A), Color(0xFF8AD2D5)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                    child: circleAvatar(
                        imageData: "", nameData: "Bima", size: 40)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Bima Andriansya",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                _customTile("Ubah Profile"),
                dotSeparator(
                  color: AppColors.grey,
                ),
                _customTile("Ganti Sandi"),
                dotSeparator(
                  color: AppColors.grey,
                ),
                _customTile("Bahasa")
              ],
            ),
          ),
          separator(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                _customTile("Beri kami bintang di Play Store"),
                dotSeparator(
                  color: AppColors.grey,
                ),
                _customTile("Laporkan Masalah")
              ],
            ),
          ),
          separator(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                DialogHelper.showConfirm(
                    title: "Keluar",
                    description: "Anda yakin mau keluar?",
                    action: () => Get.offAllNamed(AppPages.LOGIN));
              },
              child: Row(
                children: [
                  Icon(
                    Feather.log_out,
                    color: Colors.red.shade500,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Keluar",
                      style: GoogleFonts.poppins(
                          color: Colors.red.shade500,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _customTile(String label) {
    return GestureDetector(
      onTap: () => DialogHelper.showSuccess(),
      child: Row(
        children: [
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500)),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              alignment: Alignment.center,
              color: AppColors.primaryColor.withOpacity(0.15),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(
                  Feather.chevron_right,
                  color: AppColors.primaryColor,
                  size: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
