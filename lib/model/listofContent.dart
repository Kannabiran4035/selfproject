import 'package:json_annotation/json_annotation.dart';
import 'package:self_project/model/memberList.dart';

part 'listofContent.g.dart';
@JsonSerializable(explicitToJson: true)
class AllMember {
  List content;
  MemberList member;
  AllMember({required this.content, required this.member});
factory AllMember.fromJson(Map<String, dynamic> json) =>
      _$AllMemberFromJson(json);
  Map<String, dynamic> toJson() => _$AllMemberToJson(this);
}
