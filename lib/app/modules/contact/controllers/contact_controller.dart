import 'package:crud_contact/app/models/create_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  DataListContact? dataContact;
  List<String>? dataLabel;

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

  void clearCheck() {
    isCheckedKantor = false;
    isCheckedKecil = false;
    isCheckedTeman = false;
    isCheckedKantorCon = false;
    isCheckedKecilCon = false;
    isCheckedTemanCon = false;
    update();
  }

  void getListContact() async {
    http.Response? res = await Ajax.get(ContactApi.getContact);
    print(res!.body);

    // String rawContact = await rootBundle.loadString('assets/json/contact.json');
    ContactModel contactModel = ContactModel.fromJson(res.body);

    contactModel.data!.forEach((element) {
      this.listContact.add(element);

      this.listContactTemp = this.listContact;
    });

    update();
  }

  Future geDetailContact() async {
    this.detailArgs = Get.arguments;

    if (this.detailArgs is DataListContact) {
      this.dataContact = await this.detailArgs;
    }

    print('------detail contact');
    dName.text = this.dataContact!.name.toString();
    dEmail.text = this.dataContact!.email.toString();
    dHP.text = this.dataContact!.phoneNumber.toString();
    dNote.text = this.dataContact!.notes.toString();

    int jumlah = this.dataContact!.labels!.length;

    if (jumlah == 1) {
      if (this.dataContact?.labels![0] == 'Teman Kantor') {
        print('Teman Kantor');
        clearCheck();
        isCheckedKantor = true;
      } else if (this.dataContact!.labels![0] == 'Teman Kecil') {
        print('Teman Kecil');
        clearCheck();
        isCheckedKecil = true;
      } else {
        print('Teman SMA');
        clearCheck();
        isCheckedTeman = true;
      }
    }
    if (jumlah == 2) {
      if (this.dataContact?.labels![0] == 'Teman Kantor') {
        print('Teman Kantor');
        clearCheck();
        isCheckedKantor = true;
      } else if (this.dataContact!.labels![0] == 'Teman Kecil') {
        print('Teman Kecil');
        clearCheck();
        isCheckedKecil = true;
      } else {
        print('Teman SMA');
        clearCheck();
        isCheckedTeman = true;
      }
      if (this.dataContact?.labels![1] == 'Teman Kantor') {
        print('Teman Kantor');
        isCheckedKantor = true;
      } else if (this.dataContact!.labels![1] == 'Teman Kecil') {
        print('Teman Kecil');
        isCheckedKecil = true;
      } else {
        print('Teman SMA');
        isCheckedTeman = true;
      }
    }
    if (jumlah == 3) {
      if (this.dataContact?.labels![0] == 'Teman Kantor') {
        print('Teman Kantor');
        clearCheck();
        isCheckedKantor = true;
      } else if (this.dataContact!.labels![0] == 'Teman Kecil') {
        print('Teman Kecil');
        clearCheck();
        isCheckedKecil = true;
      } else {
        print('Teman SMA');
        clearCheck();
        isCheckedTeman = true;
      }
      if (this.dataContact?.labels![1] == 'Teman Kantor') {
        print('Teman Kantor');
        isCheckedKantor = true;
      } else if (this.dataContact!.labels![1] == 'Teman Kecil') {
        print('Teman Kecil');
        isCheckedKecil = true;
      } else {
        print('Teman SMA');
        isCheckedTeman = true;
      }
      if (this.dataContact?.labels![2] == 'Teman Kantor') {
        print('Teman Kantor');
        isCheckedKantor = true;
      } else if (this.dataContact!.labels![2] == 'Teman Kecil') {
        print('Teman Kecil');
        isCheckedKecil = true;
      } else {
        print('Teman SMA');
        isCheckedTeman = true;
      }
    }
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
