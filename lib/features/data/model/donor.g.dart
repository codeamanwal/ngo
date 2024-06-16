// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonorModel _$DonorModelFromJson(Map<String, dynamic> json) => DonorModel(
      donor_name: json['donor_name'] as String?,
      donor_mob_number: json['donor_mob_number'] as String,
      donor_address: json['donor_address'] as String?,
      donor_email: json['donor_email'] as String,
      donor_id_type: json['donor_id_type'] as String?,
      donor_id_number: json['donor_id_number'] as String?,
      donor_pan_number: json['donor_pan_number'] as String?,
      donor_anonymous: json['donor_anonymous'] as bool?,
      donor_products: (json['donor_products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DonorModelToJson(DonorModel instance) =>
    <String, dynamic>{
      'donor_name': instance.donor_name,
      'donor_mob_number': instance.donor_mob_number,
      'donor_address': instance.donor_address,
      'donor_email': instance.donor_email,
      'donor_id_type': instance.donor_id_type,
      'donor_id_number': instance.donor_id_number,
      'donor_pan_number': instance.donor_pan_number,
      'donor_anonymous': instance.donor_anonymous,
      'donor_products': instance.donor_products,
    };
