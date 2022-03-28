import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seov_app/controllers/base/service_controller.dart';

class HomeController extends GetxController with ServiceController {
  late final searchText = ''.obs;
  final currentCarousel = 0.obs;
  final icon = true.obs;
  
  final CarouselController carouselController = CarouselController();
  
  final searchFC = TextEditingController();

}
