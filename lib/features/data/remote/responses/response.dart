import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class GeneralResponse {
  final String? message;
  final String? token;
  final String? role;
  GeneralResponse({required this.message, this.token, this.role});

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralResponseToJson(this);
}
