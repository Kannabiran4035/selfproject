// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      productName: json['productName'] as String,
      productId: json['productId'] as String,
      productAmount: (json['productAmount'] as num).toDouble(),
      productDescription: json['productDescription'] as String,
      supplies:
          OtherSupplies.fromJson(json['supplies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'productName': instance.productName,
      'productId': instance.productId,
      'productDescription': instance.productDescription,
      'productAmount': instance.productAmount,
      'supplies': instance.supplies.toJson(),
    };
