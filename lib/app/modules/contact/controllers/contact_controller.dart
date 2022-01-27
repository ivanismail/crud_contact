import 'package:get/get.dart';

class ContactController extends GetxController {
  bool isCheckedTeman = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onSearchAppBar(String value) {
    String key = value.trim();

    if (key.isEmpty) {
      // this.listMyProductTemp = this.listMyProduct;
    } else {
      // this.listMyProductTemp = this
      //     .listMyProduct
      //     .where((element) => element.product!.productName!
      //         .toLowerCase()
      //         .contains(key.toLowerCase()))
      //     .toList();
    }
    update();
  }
}
