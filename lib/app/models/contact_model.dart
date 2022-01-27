// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class ContactModel {
  ContactModel({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  bool? success;
  List<DataListContact>? data;
  String? message;
  int? code;

  factory ContactModel.fromJson(String str) =>
      ContactModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        success: json["success"],
        data: List<DataListContact>.from(
            json["data"].map((x) => DataListContact.fromMap(x))),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "code": code,
      };
}

class DataListContact {
  DataListContact({
    this.contactId,
    this.name,
    this.email,
    this.phoneNumber,
    this.notes,
    this.labels,
    this.creator,
    this.createdAt,
    this.updatedAt,
  });

  String? contactId;
  String? name;
  String? email;
  String? phoneNumber;
  String? notes;
  List<String>? labels;
  String? creator;
  String? createdAt;
  String? updatedAt;

  factory DataListContact.fromJson(String str) =>
      DataListContact.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataListContact.fromMap(Map<String, dynamic> json) => DataListContact(
        contactId: json["contactId"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        notes: json["notes"],
        labels: List<String>.from(json["labels"].map((x) => x)),
        creator: json["creator"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "contactId": contactId,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "notes": notes,
        "labels": List<dynamic>.from(labels!.map((x) => x)),
        "creator": creator,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
