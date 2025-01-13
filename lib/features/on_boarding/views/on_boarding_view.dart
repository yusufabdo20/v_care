import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: _pages,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      setState(() {
                        _currentPage--;
                      });
                    }
                  },
                  child: const Text(
                    'Previous',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_currentPage < _pages.length - 1) {
                      setState(() {
                        _currentPage++;
                      });
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>  LoginView(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
