import 'package:get/get.dart';
import 'package:seov_app/controllers/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
