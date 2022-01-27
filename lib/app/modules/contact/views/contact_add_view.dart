import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ContactAddView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContactAddView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContactAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
