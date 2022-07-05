class ListDateModel {
  int? year;
  int? month;

  ListDateModel({this.year, this.month});

  ListDateModel.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    return data;
  }
}
