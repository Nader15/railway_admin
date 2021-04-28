class AllUsersModel {
  List<Success> success;

  AllUsersModel({this.success});

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    if (json['success'] != null) {
      success = new List<Success>();
      json['success'].forEach((v) {
        success.add(new Success.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Success {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  int wallet;
  String createdAt;
  String updatedAt;
  String phoneNumber;

  Success(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.wallet,
        this.createdAt,
        this.updatedAt,
        this.phoneNumber});

  Success.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    wallet = json['wallet'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['wallet'] = this.wallet;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
