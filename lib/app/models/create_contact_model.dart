class CreateContactModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? note;
  String? labels;
  String? userId;

  CreateContactModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.note,
    this.labels,
    this.userId,
  });

  CreateContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    note = json['notes'];
    labels = json['labels'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['notes'] = this.note;
    data['labels'] = this.labels;
    data['userId'] = this.userId;
    return data;
  }
}
