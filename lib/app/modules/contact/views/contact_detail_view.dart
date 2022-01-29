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
  void initState() {
    this.controller.geDetailContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: PageWrapper(
          child: GetBuilder<ContactController>(
            init: ContactController(),
            initState: (_) {},
            builder: (_) {
              return Column(
                children: [
                  OutlineTextField(
                    hintText: 'Nama Lengkap',
                    labelText: 'Nama Lengkap',
                    controller: this.controller.dName,
                  ),
                  OutlineTextField(
                    hintText: 'Email',
                    labelText: 'Email',
                    controller: this.controller.dEmail,
                  ),
                  OutlineTextField(
                    hintText: 'No Handphone',
                    labelText: 'No Handphone',
                    controller: this.controller.dHP,
                  ),
                  OutlineTextField(
                    hintText: 'Catatan',
                    labelText: 'Catatan',
                    controller: this.controller.dNote,
                  ),
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text("Teman Kantor"),
                    value: this.controller.isCheckedKantor,
                    onChanged: (value) => true,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text("Teman Kecil"),
                    value: this.controller.isCheckedKecil,
                    onChanged: (value) => true,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text("Teman SMA"),
                    value: this.controller.isCheckedTeman,
                    onChanged: (value) => true,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
