import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  factory DioFactory() => _instance;
  DioFactory._internal();

  static final DioFactory _instance = DioFactory._internal();
  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        // requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        // error: true,
        // compact: true,
        // maxWidth: 90,
      ),
    );
  }
}
