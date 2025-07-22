import 'package:flutter/material.dart';
import 'package:v_care/core/di/di.dart';

import 'core/routes/app_router.dart';
import 'v_care_app.dart';

void main() async {
  await setupGetIt();
  runApp(
    VCareApp(
      appRouters: AppRouters(),
    ),
  );
}
