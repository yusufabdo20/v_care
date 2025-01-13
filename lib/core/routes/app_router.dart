import 'package:flutter/material.dart';
import 'package:v_care/core/routes/routes.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => Placeholder());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => Placeholder());
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
