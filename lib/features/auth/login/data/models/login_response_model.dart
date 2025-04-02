import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final DataModel userData;

  @JsonKey(name: 'status')
  final bool status;

  @JsonKey(name: 'code')
  final int code;

  LoginResponseModel({
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class DataModel {
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'username')
  final String username;

  DataModel({
    required this.token,
    required this.username,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
