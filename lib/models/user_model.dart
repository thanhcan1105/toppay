class UserModel {
  int? id;
  String? fullName;
  String? phone;
  String? email;
  Null? emailVerifiedAt;
  String? binding;
  String? balance;
  String? bankNumber;
  String? bankName;
  String? momo;
  String? zalopay;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.binding,
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.bankNumber,
    this.momo,
    this.zalopay,
    this.bankName,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    binding = json['binding'];
    balance = json['balance'];
    momo = json['momo'];
    zalopay = json['zalopay'];
    bankNumber = json['bank_number'];
    bankName = json['bank_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['binding'] = binding;
    data['balance'] = balance;
    data['momo'] = momo;
    data['zalopay'] = zalopay;
    data['bank_number'] = bankNumber;
    data['bank_name'] = bankName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
