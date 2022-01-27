import 'package:crud_contact/app/routes/app_pages.dart';
import 'package:crud_contact/app/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        centerTitle: true,
      ),
      body: Center(
        child: PageWrapper(
          child: Column(
            children: [
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.CONTACT_DETAIL),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama',
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
                              child: PillType(
                                typeTeman: 'Teman Kantor',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
