import 'package:flutter/material.dart';

class AppLogoImageWidget extends StatelessWidget {
  final double height;

  const AppLogoImageWidget({Key? key, this.height = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/V-Care.png',
      height: height,
    );
  }
}
