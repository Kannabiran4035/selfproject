import 'package:json_annotation/json_annotation.dart';

import 'otherSuppiles.dart';

part 'productModel.g.dart';

@JsonSerializable(explicitToJson:true )
class Products {
  String productName;
  String productId;
  String productDescription;
  double productAmount;
  OtherSupplies supplies;
  Products(
      {required this.productName,
      required this.productId,
      required this.productAmount,
      required this.productDescription,
      required this.supplies});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}


