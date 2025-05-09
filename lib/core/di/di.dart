import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:v_care/core/networking/api_service.dart';
import 'package:v_care/core/networking/dio_factory.dart';
import 'package:v_care/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:v_care/features/auth/signup/data/repo/signup_repo.dart';
import 'package:v_care/features/auth/signup/logic/cubit/sign_up_cubit.dart';

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
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  // Signup
  getIt.registerLazySingleton<SignUpRepo>(
      () => SignUpRepo(apiService: getIt<ApiService>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()));
}
