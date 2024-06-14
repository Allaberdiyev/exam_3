class Product {
  String id;
  String name;
  List images;
  String categoryID;
  String description;
  int startprice;
  int endprice;
  int rating;
  String auksiontime;

  Product({
    required this.auksiontime,
    required this.name,
    required this.categoryID,
    required this.description,
    required this.endprice,
    required this.id,
    required this.images,
    required this.rating,
    required this.startprice,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
