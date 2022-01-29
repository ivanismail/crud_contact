import 'package:crud_contact/app/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar {
  static AppBar field({
    bool showBackButton = true,
    double? elevation = 2,
    PreferredSizeWidget? bottom,
    required VoidCallback onTapClose,
    required Function(String) onChange,
    required FocusNode focusNode,
  }) {
    return AppBar(
      titleSpacing: showBackButton ? 0 : 12,
      elevation: elevation,
      // leading: showBackButton
      //     ? IconButton(
      //         icon: Icon(
      //           Icons.arrow_back_ios_new_sharp,
      //           // color: HondaColor.netral9(),
      //           size: 16,
      //         ),
      //         onPressed: () => Get.back(),
      //       )
      //     : null,
      title: SolidTextField(
        hintText: 'Ketik untuk melakukan pencarian',
        textHintColor: Colors.white,
        focusNode: focusNode,
        onChange: onChange,
      ),
      backgroundColor: Colors.blue,
      bottom: bottom,
      actions: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            overlayColor: MaterialStateColor.resolveWith(
              (states) => Colors.grey.shade100,
            ),
          ),
          onPressed: onTapClose,
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static AppBar search(
    String title, {
    bool showBackButton = true,
    double? elevation = 2,
    PreferredSizeWidget? bottom,
    VoidCallback? onTapSearch,
  }) {
    return AppBar(
      titleSpacing: showBackButton ? 0 : 12,
      elevation: elevation,
      centerTitle: false,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                // color: HondaColor.netral9(),
                size: 16,
              ),
              onPressed: () => Get.back(),
            )
          : null,
      title: Text(
        title.tr,
        style: TextStyle(
          // color: HondaColor.netral9(),
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      // backgroundColor: HondaColor.netral1(),
      bottom: bottom,
      actions: [
        TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              overlayColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey.shade100,
              ),
            ),
            onPressed: onTapSearch,
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 24,
              ),
              onPressed: onTapSearch,
            )),
      ],
    );
  }
}
