// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seov_app/constant/colors.dart';
import 'package:seov_app/widgets/general/app_bar.dart';
import 'package:seov_app/widgets/general/circle_avatar.dart';
import 'package:seov_app/widgets/general/dotted_separoator.dart';
import 'package:seov_app/widgets/general/product_card.dart';

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

class DetailVendorPage extends StatelessWidget {
  const DetailVendorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return CustomScrollView(
      slivers: <Widget>[
        _sliverAppbar(),
        // _sliverPersistentHeader(),
        _sliverList()
      ],
    );
  }

  Widget _sliverAppbar() {
    return SliverAppBar(
      leading: Center(
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Icon(
              Feather.arrow_left,
              color: Colors.black,
            ),
          ),
        ),
      ),
      pinned: true,
      title: Text(
        'Rumah Sehat',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
            "https://2.bp.blogspot.com/-k6iYLSevbRg/XGz4Jtew64I/AAAAAAAAAL8/eZYg0VcaRJgNeIIUAyl-2skI49VampYPgCEwYBhgL/s1600/dekorasi%2Blamaran%2Bjakarta%2Bbekasi%2B%25284%2529.jpg",
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _sliverPersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegate(Colors.white, "_title"),
    );
  }

  Widget _sliverList() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(0),
              elevation: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Feather.globe,
                                  size: 18,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Website",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryColor)),
                              ]),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Feather.message_square,
                                  size: 18,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Chat",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryColor)),
                              ]),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Feather.heart,
                                  size: 18,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Favorit",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryColor)),
                              ]),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Produk",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Text(
                            "Lihat Semua...",
                            style: GoogleFonts.poppins(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    dotSeparator(
                      color: AppColors.grey,
                    ),
                    Container(
                        height: Get.height * 0.15,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: imgList.length,
                            itemBuilder: (context, index) {
                              return productCard(imgList, index);
                            })),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.all(0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Social Media",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Container(
                      height: 20,
                      width: 20,
                      child: Icon(Feather.facebook),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: Icon(Feather.twitter),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: Icon(Feather.instagram),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Info",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    dotSeparator(
                      color: AppColors.grey,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letra.",
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  width: Get.width,
                  child: Column(
                    children: [
                      Text(
                        "Bagikan pengalamanmu bersama Lorem Ipsum",
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text("Tambah Ulasan",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.all(0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: Get.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ulasan (2)",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "Lihat Semua...",
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    dotSeparator(
                      color: AppColors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              circleAvatar(
                                  imageData:
                                      "https://randomuser.me/api/portraits/med/women/1.jpg",
                                  nameData: "Gilang",
                                  size: 25),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Gilang Ac",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("11 November 2021",
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              ),
                              Spacer(),
                              _rating()
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letra.",
                            style: GoogleFonts.poppins(
                                fontSize: 10, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              circleAvatar(
                                  imageData:
                                      "https://randomuser.me/api/portraits/med/women/2.jpg",
                                  nameData: "Bima",
                                  size: 25),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Bima",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("11 November 2021",
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              ),
                              Spacer(),
                              _rating()
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letra.",
                            style: GoogleFonts.poppins(
                                fontSize: 10, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ))
      ]),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String _title;

  Delegate(this.backgroundColor, this._title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Feather.globe,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Website",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor)),
                    ]),
              ),
            )),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Feather.message_square,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Chat",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor)),
                    ]),
              ),
            )),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Feather.heart,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Favorit",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor)),
                    ]),
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

Widget _rating() {
  return Row(
    children: const [
      Icon(
        Icons.star,
        color: AppColors.primaryColor,
        size: 15,
      ),
      Icon(
        Icons.star,
        color: AppColors.primaryColor,
        size: 15,
      ),
      Icon(
        Icons.star,
        color: AppColors.primaryColor,
        size: 15,
      ),
      Icon(
        Icons.star,
        color: AppColors.primaryColor,
        size: 15,
      ),
      Icon(
        Icons.star,
        color: AppColors.grey,
        size: 15,
      ),
    ],
  );
}
