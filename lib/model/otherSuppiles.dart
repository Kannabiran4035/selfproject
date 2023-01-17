import 'package:json_annotation/json_annotation.dart';

part 'otherSuppiles.g.dart';
@JsonSerializable()
class OtherSupplies {
  String one;
  String two;
  String three;
  String four;
  OtherSupplies(
      {required this.one,
      required this.two,
      required this.three,
      required this.four});
  factory OtherSupplies.fromJson(Map<String, dynamic> json) => _$OtherSuppliesFromJson(json);
  Map<String, dynamic> toJson() => _$OtherSuppliesToJson(this);
}
