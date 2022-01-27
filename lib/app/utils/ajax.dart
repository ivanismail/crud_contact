import 'dart:convert';

import 'package:crud_contact/const.dart';
import 'package:http/http.dart' as http;

class Ajax {
  static Future<http.Response?> post(
      String url, Map<String, dynamic> data) async {
    http.Response? res;
    try {
      String username = 'crud';
      String password = 'da1c25d8-37c8-41b1-afe2-42dd4825bfea';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      res = await http.post(Uri.parse(BASE_URL + url), body: data, headers: {
        'authorization': basicAuth,
      });
    } catch (e) {
      // gotoErrorPage('AJAX : ' + e.toString());
    }
    return res;
  }

  static Future<http.Response?> get(String url) async {
    http.Response? res;
    try {
      String username = 'crud';
      String password = 'da1c25d8-37c8-41b1-afe2-42dd4825bfea';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      res = await http.get(Uri.parse(BASE_URL + url),
          headers: {'authorization': basicAuth});
    } catch (e) {
      // gotoErrorPage('AJAX : ' + e.toString());
    }
    return res;
  }
}
