import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care/core/di/di.dart';
import 'package:v_care/core/routes/routes.dart';
import 'package:v_care/features/auth/login/logic/cubit/login_cubit.dart';

import '../../features/auth/login/presentation/views/login/login_view.dart';
import '../../features/on_boarding/views/on_boarding_view.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBoardingView());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: LoginView(),
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
