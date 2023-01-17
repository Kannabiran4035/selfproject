// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

import 'productList.dart';
part 'productsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class Welcome {
  Welcome({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  List<Product> products;
  int total;
  int skip;
  int limit;
  factory Welcome.fromJson(Map<String, dynamic> json) =>
      _$WelcomeFromJson(json);
      Map<String, dynamic> toJson() =>_$WelcomeToJson(this);
}
