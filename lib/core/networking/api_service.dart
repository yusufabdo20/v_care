import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:v_care/core/helpers/app_contants.dart';
import 'package:v_care/core/networking/api_constants.dart';
part 'api_service.g.dart';

// RestAPi=> Annotation for Retrofit , based on Dio library , used for API calls
@RestApi(
  baseUrl: ApiConstants.baseUrl,
)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<String> login(
    @Body() Map<String, dynamic> body,
  );
}
