import 'package:json_annotation/json_annotation.dart';
import 'package:ngo/features/data/model/donor.dart';

part 'verify_response.g.dart';

@JsonSerializable()
class VerifyResponse {
  final DonorModel donor;
  final int iat;
  final int exp;

  VerifyResponse({required this.donor, required this.iat, required this.exp});

  factory VerifyResponse.fromJson(Map<String, dynamic> map) =>
      _$VerifyResponseFromJson(map);

  Map<String, dynamic> toJson() => _$VerifyResponseToJson(this);
}
