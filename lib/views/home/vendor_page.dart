// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:seov_app/widgets/general/app_bar.dart';
import 'package:seov_app/widgets/general/vendor_card.dart';

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

class VendorPage extends StatelessWidget {
  String label = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: label),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView.builder(
        padding: EdgeInsets.all(15),
        physics: BouncingScrollPhysics(),
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return vendorCard(imgList, index);
        });
  }
}
