import 'package:json_annotation/json_annotation.dart';
import 'package:product_list_app/feature/product/domain/entity/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.brand,
    required super.category,
    required super.thumbnail,
    required super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
