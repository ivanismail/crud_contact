import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:crud_contact/app/models/errorresponse_model.dart';
import 'package:crud_contact/app/models/failresponse_model.dart';
import 'package:crud_contact/app/models/statusresponse_model.dart';

class APIResponse {
  static String error() => 'error';
  static String fail() => 'fail';
  static String success() => 'success';

  static String? getStatus(String data) {
    StatusResponseModel errorResponseModel =
        StatusResponseModel.fromJson(jsonDecode(data));
    return errorResponseModel.status;
  }

  static String? getError(String data) {
    ErrorResponseModel errorResponseModel =
        ErrorResponseModel.fromJson(jsonDecode(data));
    return errorResponseModel.errors!.values.toList()[0][0];
  }

  static String? getMessage(String data) {
    FailResponseModel failResponseModel =
        FailResponseModel.fromJson(jsonDecode(data));
    return failResponseModel.message;
  }

  static bool isFail(http.Response res) =>
      APIResponse.getStatus(res.body) == APIResponse.fail();

  static bool validate(http.Response res) {
    print(res.body);
    if (APIResponse.getStatus(res.body) == APIResponse.error()) {
      print('error');
      return false;
    }

    if (APIResponse.getStatus(res.body) == APIResponse.fail()) {
      print('fail');
      if (APIResponse.getMessage(res.body)!.toLowerCase() == 'unauthenticate') {
        return false;
      }

      return false;
    }

    return true;
  }
}
