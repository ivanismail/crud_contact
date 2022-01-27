import 'package:crud_contact/app/modules/contact/views/contact_add_view.dart';
import 'package:crud_contact/app/modules/contact/views/contact_detail_view.dart';
import 'package:get/get.dart';

import 'package:crud_contact/app/modules/contact/bindings/contact_binding.dart';
import 'package:crud_contact/app/modules/contact/views/contact_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CONTACT;

  static final routes = [
    GetPage(
      name: _Paths.CONTACT,
      page: () => ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_DETAIL,
      page: () => ContactDetailView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_ADD,
      page: () => ContactAddView(),
      binding: ContactBinding(),
    ),
  ];
}
