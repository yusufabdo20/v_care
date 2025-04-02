import 'package:flutter/material.dart';
import 'package:v_care/core/helpers/app_images.dart';

class AppLogoImageWidget extends StatelessWidget {
  final double height;

  const AppLogoImageWidget({Key? key, this.height = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      height: height,
    );
  }
}
