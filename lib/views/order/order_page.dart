// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seov_app/constant/colors.dart';
import 'package:seov_app/widgets/general/app_bar.dart';
import 'package:seov_app/widgets/general/vendor_card.dart';
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

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(appBar: _appBar(), body: _body()),
    );
  }

  PreferredSizeWidget _appBar() {
    return appBar(
        title: "Pesanan Saya",
        canBack: false,
        actions: [
          Container(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Feather.bell),
          ))
        ],
        bottom: TabBar(
          physics: BouncingScrollPhysics(),
          isScrollable: true,
          indicatorColor: AppColors.primaryColor,
          indicatorWeight: 2.0,
          labelColor: AppColors.primaryColor,
          labelPadding: EdgeInsets.only(top: 10.0),
          unselectedLabelColor: AppColors.textColor,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            _tabBar("Belum Bayar"),
            _tabBar("DP"),
            _tabBar("Lunas"),
            _tabBar("Selesai"),
            _tabBar("Dibatalkan"),
          ],
        ));
  }

  Widget _tabBar(String label) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Text(label,
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _body() {
    return TabBarView(
      // ignore: prefer_const_literals_to_create_immutables
      physics: BouncingScrollPhysics(),
      children: [
        _bodyToPay(),
        _bodyToPay(),
        _bodyToPay(),
        _bodyToPay(),
        _bodyToPay()
      ],
    );
  }

  Widget _bodyToPay() {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        physics: BouncingScrollPhysics(),
        itemCount: imgList.length,
        itemBuilder: (BuildContext ctx, index) {
          return orderCard(imgList, index);
        });
  }

  Widget _bodyVendor() {
    return ListView.builder(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return vendorCard(imgList, index);
        });
  }
}
