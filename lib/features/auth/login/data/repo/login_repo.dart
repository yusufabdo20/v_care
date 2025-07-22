import 'package:v_care/core/networking/api_result.dart';
import 'package:v_care/features/auth/login/data/models/login_request_body.dart';
import 'package:v_care/features/auth/login/data/models/login_response_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_service.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo({required this.apiService});
  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  // Future<ApiResult<LoginResponseModel>> loginWithGoogle(
  //   String idToken,
  // ) async {
  //   try {
  //     final response = await apiService.loginWithGoogle(idToken);
  //     return ApiResult.success(data: response);
  //   } catch (e) {
  //     return ApiResult.error(message: e.toString());
  //   }
  // }
  // Future<ApiResult<LoginResponseModel>> loginWithFacebook(
  //   String accessToken,
  // ) async {
  //   try {
  //     final response = await apiService.loginWithFacebook(accessToken);
  //     return ApiResult.success(data: response);
  //   } catch (e) {
  //     return ApiResult.error(message: e.toString());
  //   }
  // }
}
