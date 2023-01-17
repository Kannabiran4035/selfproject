// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Welcome _$WelcomeFromJson(Map<String, dynamic> json) => Welcome(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      skip: json['skip'] as int,
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$WelcomeToJson(Welcome instance) => <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
