import 'package:crud_contact/app/modules/contact/controllers/contact_controller.dart';
import 'package:crud_contact/app/widgets/page_wrapper.dart';
import 'package:crud_contact/app/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailView extends StatefulWidget {
  ContactDetailView({Key? key}) : super(key: key);

  @override
  State<ContactDetailView> createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends State<ContactDetailView> {
  final ContactController controller = Get.find<ContactController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
        centerTitle: true,
      ),
      body: PageWrapper(
        child: Column(
          children: [
            OutlineTextField(
              hintText: 'Nama Lengkap',
              labelText: 'Nama Lengkap',
            ),
            OutlineTextField(
              hintText: 'Email',
              labelText: 'Email',
            ),
            OutlineTextField(
              hintText: 'No Handphone',
              labelText: 'No Handphone',
            ),
            OutlineTextField(
              hintText: 'Catatan',
              labelText: 'Catatan',
            ),
            CheckboxListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text("Teman Kantor"),
              value: controller.isCheckedTeman,
              onChanged: (value) => true,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text("Teman Kecil"),
              value: controller.isCheckedTeman,
              onChanged: (value) => true,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            // Container(
            //   width: Get.width,
            //   child: OutlineButton(
            //     text: 'Update'.tr,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
