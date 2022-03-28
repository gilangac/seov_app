// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seov_app/constant/colors.dart';
import 'package:seov_app/controllers/base/navigator_controller.dart';
import 'package:seov_app/views/home/home_page.dart';
import 'package:seov_app/views/order/order_page.dart';
import 'package:seov_app/views/profile/profile_page.dart';
import 'package:seov_app/views/whishlist/whishlist_page.dart';

class BottomNavigator extends StatelessWidget {
  final NavigatorController navigatorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigatorController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomePage(),
              WhishlistPage(),
              OrderPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          selectedItemColor: AppColors.primaryColor,
          onTap: controller.onChangeTab,
          currentIndex: controller.tabIndex,
          enableFeedback: false,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(
                'home_icon_fill.png', 'home_icon.png', 'Home'),
            _bottomNavigationBarItem(
                'fav_icon_fill.png', 'fav_icon.png', 'Whishlist'),
            _bottomNavigationBarItem(
                'order_icon_fill.png', 'order_icon.png', 'Order'),
            _bottomNavigationBarItem(
                'user_icon_fill.png', 'user_icon.png', 'Profile'),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem(String activeIcon, String icon, String labelMenu) {
    return BottomNavigationBarItem(
        activeIcon: Container(
          height: 20,
          child: Image.asset("assets/images/" + activeIcon),
        ),
        icon: Container(
          height: 20,
          child: Image.asset("assets/images/" + icon),
        ),
        label: labelMenu);
  }
}
