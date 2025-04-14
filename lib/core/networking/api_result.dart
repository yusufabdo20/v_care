import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:v_care/core/networking/api_error_handler.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}
//  String message Can Convert to Object of ErrorHandler , const factory ApiResult.failure(String message) = Failure<T>;
