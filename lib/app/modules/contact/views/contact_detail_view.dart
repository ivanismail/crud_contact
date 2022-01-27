import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ContactDetailView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContactDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContactDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
