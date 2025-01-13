import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care/core/widgets/app_logo_image_widget.dart';

import '../../auth/presentation/views/login/login_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    OnBoardingPage(
      image: 'assets/onboarding1.png',
      title: 'Welcome to V-Care',
      subtitle: 'Your virtual healthcare assistant',
    ),
    OnBoardingPage(
      image: 'assets/onboarding2.png',
      title: 'Book Appointments',
      subtitle: 'Book your doctor appointments with just a few clicks',
    ),
    OnBoardingPage(
      image: 'assets/onboarding3.png',
      title: 'Track Your Health',
      subtitle: 'Track your medication, appointments and health records',
    ),
    OnBoardingPage(
      image: 'assets/onboarding4.png',
      title: 'Stay Connected',
      subtitle: 'Stay connected with your doctor and receive personalized care',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30.0.h),
            child: Column(children: [
              AppLogoImageWidget(),
            ]),
          ),
        ),
      )),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnBoardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(height: 40),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
