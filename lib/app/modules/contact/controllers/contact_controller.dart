import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:crud_contact/app/models/contact_model.dart';
import 'package:crud_contact/app/restapi/contact_api.dart';
import 'package:crud_contact/app/utils/ajax.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  bool isCheckedTeman = false;
  var detailArgs;

  List<DataListContact> listContact = [];
  List<DataListContact> listContactTemp = [];

  TextEditingController dName = TextEditingController();
  TextEditingController dEmail = TextEditingController();
  TextEditingController dHP = TextEditingController();
  TextEditingController dNote = TextEditingController();
  bool isCheckedKantor = false;
  bool isCheckedKecil = false;

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

  void getListContact() async {
    http.Response? res = await Ajax.get(ContactApi.getContact);
    print(res!.body);

    ContactModel contactModel = ContactModel.fromJson(res.body);

    contactModel.data!.forEach((element) {
      this.listContact.add(element);

      this.listContactTemp = this.listContact;
    });

    update();
  }

  void geDetailContact() async {
    update();
  }
}
