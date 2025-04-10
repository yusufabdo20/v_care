import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'code')
  int code;

  ApiErrorModel({
    required this.message,
    required this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}
