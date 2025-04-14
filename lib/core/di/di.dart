import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:v_care/core/networking/api_constants.dart';
import 'package:v_care/core/networking/api_service.dart';
import 'package:v_care/core/networking/dio_factory.dart';
import 'package:v_care/features/auth/login/logic/cubit/login_cubit.dart';

import '../../features/auth/login/data/repo/login_repo.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  // Login
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(apiService: getIt<ApiService>()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}
