import 'package:crud_contact/app/models/contact_model.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  bool isCheckedTeman = false;

  List<DataListContact> listContact = [];
  List<DataListContact> listContactTemp = [];

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
