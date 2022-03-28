import 'package:get/get.dart';
import 'package:seov_app/controllers/whishlist/whishlist_controller.dart';

class WishlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WhishlistController());
  }
}
