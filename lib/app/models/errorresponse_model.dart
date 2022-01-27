
class ErrorResponseModel {
  String? status, message;
  Map<String, dynamic>? errors;

  ErrorResponseModel({this.status, this.errors, this.message});

  ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'] != null ? json['errors'] : null;
  }
}
