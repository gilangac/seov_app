import 'package:get/get.dart';
import 'package:seov_app/controllers/order/order_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController(), fenix: true);
  }
}
