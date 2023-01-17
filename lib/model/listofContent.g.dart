// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listofContent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllMember _$AllMemberFromJson(Map<String, dynamic> json) => AllMember(
      content: json['content'] as List<dynamic>,
      member: MemberList.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllMemberToJson(AllMember instance) => <String, dynamic>{
      'content': instance.content,
      'member': instance.member.toJson(),
    };
