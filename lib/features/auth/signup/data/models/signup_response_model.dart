import 'package:json_annotation/json_annotation.dart';
part 'signup_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final UserData data;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'code')
  final String code;

  SignUpResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });
  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}
@JsonSerializable()
class UserData {
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  UserData({
    required this.token,
    required this.userName,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}