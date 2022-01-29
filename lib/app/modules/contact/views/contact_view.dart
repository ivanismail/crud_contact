import 'package:crud_contact/app/models/contact_model.dart';
import 'package:crud_contact/app/routes/app_pages.dart';
import 'package:crud_contact/app/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final ContactController controller = Get.find<ContactController>();

  @override
  void initState() {
    super.initState();
    this.controller.getListContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ContactController>(
              init: ContactController(),
              initState: (_) {},
              builder: (_) {
                return ListContacts(controller: controller);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CONTACT_ADD),
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final DataListContact current;
  final ContactController controller;
  const ContactCard({
    Key? key,
    required this.current,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            child: InkWell(
              onTap: () => Get.toNamed(
                Routes.CONTACT_DETAIL,
                arguments: current,
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this.current.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          children: List.generate(current.labels?.length ?? 0,
                              (index) {
                            String type = (current.labels![index]);
                            return PillType(typeTeman: type);
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12)
      ],
    );
  }
}

class ListContacts extends StatelessWidget {
  final ContactController controller;
  const ListContacts({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageWrapper(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: this.controller.listContactTemp.length,
          // itemCount: 10,
          itemBuilder: (context, index) {
            DataListContact current = this.controller.listContactTemp[index];

            return ContactCard(
              current: current,
              controller: controller,
            );
          },
        ),
      ),
    );
  }
}

class PillType extends StatelessWidget {
  final String typeTeman;
  const PillType({
    Key? key,
    required this.typeTeman,
  }) : super(key: key);

  Color _getColorType() {
    if (typeTeman == 'Teman Kantor') return Colors.blueAccent;
    if (typeTeman == 'Teman Kecil') return Colors.redAccent;
    return Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: this._getColorType(),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Text(this.typeTeman.toString()),
        ],
      ),
    );
  }
}
