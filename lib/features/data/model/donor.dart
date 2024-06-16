import 'package:json_annotation/json_annotation.dart';
import 'package:ngo/features/domain/entity/donor.dart';

part 'donor.g.dart';

@JsonSerializable()
class DonorModel extends DonorEntity {
  DonorModel({
    super.donor_name,
    required super.donor_mob_number,
    super.donor_address,
    required super.donor_email,
    super.donor_id_type,
    super.donor_id_number,
    super.donor_pan_number,
    super.donor_anonymous,
    super.donor_products,
  });

  DonorModel copyWith(
      {String? donor_name,
      String? donor_mob_number,
      String? donor_address,
      String? donor_email,
      String? donor_id_type,
      String? donor_id_number,
      String? donor_pan_number,
      bool? donor_anonymous,
      List<String>? donor_products}) {
    return DonorModel(
        donor_name: donor_name ?? this.donor_name,
        donor_mob_number: donor_mob_number ?? this.donor_mob_number,
        donor_address: donor_address ?? this.donor_address,
        donor_email: donor_email ?? this.donor_email,
        donor_id_type: donor_id_type ?? this.donor_id_type,
        donor_id_number: donor_id_number ?? this.donor_id_number,
        donor_pan_number: donor_pan_number ?? this.donor_pan_number,
        donor_anonymous: donor_anonymous ?? this.donor_anonymous,
        donor_products: donor_products ?? this.donor_products);
  }

  factory DonorModel.fromJson(Map<String, dynamic> json) =>
      _$DonorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DonorModelToJson(this);
}
