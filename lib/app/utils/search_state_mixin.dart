import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class SearchStateMixin extends GetxController {
  FocusNode appBarSearchingFocusNode = FocusNode();
  bool isSearching = false;

  void changeStateSearch() {
    this.isSearching = !this.isSearching;

    update();
    if (this.isSearching) this.appBarSearchingFocusNode.requestFocus();
    this.onSearchAppBar('');
  }

  void onSearchAppBar(String value);
}
