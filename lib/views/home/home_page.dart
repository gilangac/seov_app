// ignore_for_file: prefer_is_empty, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, unrelated_type_equality_checks, unused_element

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seov_app/constant/colors.dart';
import 'package:seov_app/controllers/home/home_controller.dart';
import 'package:seov_app/helpers/dialog_helper.dart';
import 'package:seov_app/routes/pages.dart';
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

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: statusBarHeight,
            color: Colors.transparent,
          ),
          _header(),
          _body(),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: Get.width,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                child: TextFormField(
                  controller: homeController.searchFC,
                  onChanged: (value) {
                    homeController.searchText.value = value;
                  },
                  decoration: InputDecoration(
                    fillColor: AppColors.lightGrey,
                    hintText: 'Cari Vendor',
                    prefixIcon:
                        Icon(Feather.search, color: Colors.grey.shade400),
                    suffixIcon: homeController.searchFC.text.length > 0 ||
                            homeController.searchText.value != ''
                        ? GestureDetector(
                            onTap: () {
                              homeController.searchFC.clear();
                              homeController.searchText.value = '';
                            },
                            child: Icon(Feather.x, color: Colors.black54),
                          )
                        : null,
                  ),
                  // validator: validator,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                homeController.icon.value == true
                    ? homeController.icon.value = false
                    : homeController.icon.value = true;
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  height: 50,
                  width: 50,
                  color: AppColors.lightGrey,
                  child: Icon(Feather.bell),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _carousel(),
                  homeController.icon.value ? _categories2() : _categories(),
                  SizedBox(height: 15),
                  _populerVendor(),
                  SizedBox(height: 15),
                  _populerProduct(),
                  SizedBox(height: 15),
                ])),
      ),
    );
  }

  Widget _carousel() {
    return FadeInDown(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                child: CarouselSlider(
                    carouselController: homeController.carouselController,
                    options: CarouselOptions(
                        height: Get.height * 0.2,
                        autoPlay: true,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlayInterval: Duration(seconds: 7),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        onPageChanged: (index, reason) {
                          homeController.currentCarousel.value = index;
                        }),
                    items: imageSliders),
              ),
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => homeController.carouselController
                          .animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: homeController.currentCarousel == entry.key
                                ? AppColors.primaryColor
                                : AppColors.grey),
                      ),
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }

  Widget _categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Row(
                children: [
                  _iconCategories('mc_icon.png', 'MC'),
                  Spacer(),
                  _iconCategories('make_up.png', 'Make Up'),
                  Spacer(),
                  _iconCategories('other_icon.png', 'Sound System'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  _iconCategories('photo_icon.png', 'Fotografi'),
                  Spacer(),
                  _iconCategories('documentation_icon.png', 'Videografi'),
                  Spacer(),
                  _iconCategories('entertainment_icon.png', 'Hiburan'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _categories2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _iconCategories2('icon_mc.png', 'MC', 'mc'),
                  Spacer(),
                  _iconCategories2('make_up_icon.png', 'Make Up', 'makeup'),
                  Spacer(),
                  _iconCategories2(
                      'sound_icon.png', 'Sound System', 'soundsystem'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _iconCategories2('camera_icon.png', 'Fotografi', 'fotografi'),
                  Spacer(),
                  _iconCategories2(
                      'video_icon.png', 'Videografi', 'videografi'),
                  Spacer(),
                  _iconCategories2('other_icon.png', 'Hiburan', 'hiburan'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _iconCategories(String icon, String label) {
    return GestureDetector(
      onTap: () => DialogHelper.showSuccess(),
      child: FadeInDown(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 70,
                width: 70,
                color: AppColors.lightGrey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Container(
                    height: 40,
                    child: Image.asset(
                      'assets/images/categories/' + icon,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(label,
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }

  Widget _iconCategories2(String icon, String label, String path) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPages.VENDOR + path, arguments: label);
      },
      child: FadeInDown(
        child: Container(
          width: 90,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Container(
                  height: 50,
                  child: Image.asset(
                    'assets/images/categories/' + icon,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Text(label,
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w400))
            ],
          ),
        ),
      ),
    );
  }

  Widget _populerVendor() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Vendor Populer',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        FadeInRight(
          child: Container(
              height: Get.height * 0.13,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: imgList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.blue,
                              width: Get.width * 0.4,
                              child: Image.network(
                                imgList[index].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sun City Hall',
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      _rating()
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
        ),
      ],
    );
  }

  Widget _populerProduct() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Produk Populer',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        FadeInRight(
          child: Container(
              height: Get.height * 0.15,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: imgList.length,
                  itemBuilder: (context, index) {
                    return productCard(imgList, index);
                  })),
        ),
      ],
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
}
