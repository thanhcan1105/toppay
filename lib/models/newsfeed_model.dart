class NewsFeedModel {
  int? id;
  String? title;
  String? description;
  String? content;
  String? image;
  String? createdAt;
  String? updatedAt;

  NewsFeedModel(
      {this.id,
      this.title,
      this.description,
      this.content,
      this.image,
      this.createdAt,
      this.updatedAt});

  NewsFeedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['content'] = this.content;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
