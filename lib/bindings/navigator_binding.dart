import 'package:get/get.dart';
import 'package:seov_app/controllers/base/navigator_controller.dart';

class NavigatorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
  }
}
