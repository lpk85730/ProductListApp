// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'] as int,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductElementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      discountedTotal: json['discountedTotal'] as int,
      userId: json['userId'] as int,
      totalProducts: json['totalProducts'] as int,
      totalQuantity: json['totalQuantity'] as int,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'products': instance.products,
      'total': instance.total,
      'discountedTotal': instance.discountedTotal,
      'userId': instance.userId,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.totalQuantity,
    };

ProductElementModel _$ProductElementModelFromJson(Map<String, dynamic> json) =>
    ProductElementModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
      total: json['total'] as int,
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      discountedPrice: json['discountedPrice'] as int,
    );

Map<String, dynamic> _$ProductElementModelToJson(
  ProductElementModel instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'discountPercentage': instance.discountPercentage,
      'discountedPrice': instance.discountedPrice,
    };
