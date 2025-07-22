import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/signup_request_body.dart';
import '../models/signup_response_model.dart';

class SignUpRepo {
  final ApiService apiService;

  SignUpRepo({required this.apiService});
  Future<ApiResult<SignUpResponseModel>> signUp(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }}