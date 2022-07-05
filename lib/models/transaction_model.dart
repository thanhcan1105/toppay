class TransactionModel {
  int? id;
  int? userId;
  int? amount;
  int? status;
  int? subject;
  int? tax;
  String? dateExpected;
  String? transactionCode;
  String? payment;
  String? createdAt;
  String? updatedAt;

  TransactionModel({
    this.id,
    this.userId,
    this.amount,
    this.status,
    this.subject,
    this.createdAt,
    this.updatedAt,
    this.transactionCode,
    this.payment,
    this.dateExpected,
    this.tax,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    status = json['status'];
    subject = json['subject'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    transactionCode = json['transaction_code'];
    payment = json['payment'];
    tax = json['tax']??0;
    dateExpected = json['date_expected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['status'] = status;
    data['subject'] = subject;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['transaction_code'] = transactionCode;
    data['payment'] = payment;
    data['tax'] = tax;
    data['date_expected'] = dateExpected;
    return data;
  }

  fromJson(String element) {}
}
