import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care/core/routes/app_router.dart';
import 'package:v_care/core/theme/app_colors.dart';

import 'core/routes/routes.dart';

class VCareApp extends StatelessWidget {
  VCareApp({super.key, appRouters});

  final AppRouters appRouters = AppRouters();
  @override

  /// The build method for the VCareApp widget.
  ///
  /// This function builds a [MaterialApp] with a [debugShowCheckedModeBanner]
  /// set to false, a [title] of "V-Care App", a [theme] with a deep purple
  /// color scheme and [useMaterial3] set to true. The [onGenerateRoute]
  /// parameter is set to the [onGenerateRoute] function of the [appRouters]
  /// instance.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'V-Care App',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: appRouters.generateRoute,
        initialRoute: Routes.loginScreen,
      ),
    );
  }
}
