import 'package:json_annotation/json_annotation.dart';
part 'memberList.g.dart';

@JsonSerializable(explicitToJson: true)
class MemberList {
  String id;
  String memberCode;
  String memberName;
  String spounseName;
  String address;
  String cityName;
  String taluk;
  String district;
  MemberList(
      {required this.id,
      required this.memberCode,
      required this.memberName,
      required this.spounseName,
      required this.address,
      required this.cityName,
      required this.taluk,
      required this.district});

  factory MemberList.fromJson(Map<String, dynamic> json) =>
      _$MemberListFromJson(json);
  Map<String, dynamic> toJson() => _$MemberListToJson(this);
}
