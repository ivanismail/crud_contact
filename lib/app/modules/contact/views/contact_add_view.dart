import 'package:crud_contact/app/modules/contact/controllers/contact_controller.dart';
import 'package:crud_contact/app/widgets/buttons.dart';
import 'package:crud_contact/app/widgets/page_wrapper.dart';
import 'package:crud_contact/app/widgets/text_fields.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ContactAddView extends StatefulWidget {
  const ContactAddView({Key? key}) : super(key: key);

  @override
  _ContactAddViewState createState() => _ContactAddViewState();
}

class _ContactAddViewState extends State<ContactAddView> {
  final ContactController controller = Get.find<ContactController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: PageWrapper(
          child: Column(
            children: [
              OutlineTextField(
                hintText: 'Nama Lengkap',
                labelText: 'Nama Lengkap',
                controller: this.controller.dNameCon,
              ),
              OutlineTextField(
                hintText: 'Email',
                labelText: 'Email',
                controller: this.controller.dEmailCon,
              ),
              OutlineTextField(
                hintText: 'No Handphone',
                labelText: 'No Handphone',
                controller: this.controller.dHPCon,
              ),
              OutlineTextField(
                hintText: 'Catatan',
                labelText: 'Catatan',
                controller: this.controller.dNoteCon,
              ),
              CheckboxListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text("Teman Kantor"),
                value: controller.isCheckedKantorCon,
                onChanged: (value) => true,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text("Teman Kecil"),
                value: controller.isCheckedKecilCon,
                onChanged: (value) => true,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text("Teman SMA"),
                value: controller.isCheckedTemanCon,
                onChanged: (value) => true,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Container(
                width: Get.width,
                child: SolidButton(
                  text: 'Simpan',
                  onTap: controller.addContact,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
