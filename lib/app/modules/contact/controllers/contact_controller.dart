import 'package:crud_contact/app/models/create_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:crud_contact/app/models/contact_model.dart';
import 'package:crud_contact/app/restapi/contact_api.dart';
import 'package:crud_contact/app/utils/ajax.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var detailArgs;

  List<DataListContact> listContact = [];
  List<DataListContact> listContactTemp = [];

  TextEditingController dName = TextEditingController();
  TextEditingController dEmail = TextEditingController();
  TextEditingController dHP = TextEditingController();
  TextEditingController dNote = TextEditingController();
  bool isCheckedKantor = false;
  bool isCheckedKecil = false;
  bool isCheckedTeman = false;

  TextEditingController dNameCon = TextEditingController();
  TextEditingController dEmailCon = TextEditingController();
  TextEditingController dHPCon = TextEditingController();
  TextEditingController dNoteCon = TextEditingController();
  bool isCheckedKantorCon = false;
  bool isCheckedKecilCon = false;
  bool isCheckedTemanCon = false;

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

  void addContact() async {
    CreateContactModel createContactModel = CreateContactModel(
      name: dNameCon.text,
      email: dEmailCon.text,
      phoneNumber: dHPCon.text,
      note: dNoteCon.text,
      labels: '',
      userId: 'ba09edc7-c45c-46d4-87c3-5e7eed6aba6b',
    );

    http.Response? res =
        await Ajax.post(ContactApi.createContact, createContactModel.toJson());
  }
}
