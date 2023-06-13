import 'package:json_annotation/json_annotation.dart';

part 'carts_model.g.dart';

@JsonSerializable()
class CartModel {
  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  int id;
  List<ProductElementModel> products;
  int total;
  int discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class ProductElementModel {
  ProductElementModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
  });

  factory ProductElementModel.fromJson(Map<String, dynamic> json) =>
      _$ProductElementModelFromJson(json);

  int id;
  String title;
  int price;
  int quantity;
  int total;
  double discountPercentage;
  int discountedPrice;

  Map<String, dynamic> toJson() => _$ProductElementModelToJson(this);
}
