// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) =>
    VerifyResponse(
      donor: DonorModel.fromJson(json['donor'] as Map<String, dynamic>),
      iat: json['iat'] as int,
      exp: json['exp'] as int,
    );

Map<String, dynamic> _$VerifyResponseToJson(VerifyResponse instance) =>
    <String, dynamic>{
      'donor': instance.donor,
      'iat': instance.iat,
      'exp': instance.exp,
    };
