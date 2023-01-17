// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memberList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberList _$MemberListFromJson(Map<String, dynamic> json) => MemberList(
      id: json['id'] as String,
      memberCode: json['memberCode'] as String,
      memberName: json['memberName'] as String,
      spounseName: json['spounseName'] as String,
      address: json['address'] as String,
      cityName: json['cityName'] as String,
      taluk: json['taluk'] as String,
      district: json['district'] as String,
    );

Map<String, dynamic> _$MemberListToJson(MemberList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberCode': instance.memberCode,
      'memberName': instance.memberName,
      'spounseName': instance.spounseName,
      'address': instance.address,
      'cityName': instance.cityName,
      'taluk': instance.taluk,
      'district': instance.district,
    };
