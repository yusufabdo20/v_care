import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care/core/routes/app_router.dart';
import 'package:v_care/core/theme/colors_manager.dart';

import 'core/routes/routes.dart';

class VCareApp extends StatelessWidget {
  VCareApp({super.key, appRouters});

  final AppRouters appRouters = AppRouters();
  @override


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'V-Care App',
        theme: ThemeData(
         useMaterial3: true,
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: appRouters.generateRoute,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
