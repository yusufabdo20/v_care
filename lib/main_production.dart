import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care/core/di/di.dart';

import 'core/routes/app_router.dart';
import 'v_care_app.dart';

void main() async {
  await setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();

  ///
  await ScreenUtil.ensureScreenSize();
  runApp(
    VCareApp(
      appRouters: AppRouters(),
    ),
  );
}
