class ProductModel {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;

  ProductModel(
      {this.id, this.title, this.price, this.description, this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    return data;
  }
}
