import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care/core/helpers/app_images.dart';
import 'package:v_care/core/helpers/extentions/navigate_extention.dart';
import 'package:v_care/core/routes/routes.dart';
import 'package:v_care/core/widgets/app_logo_image_widget.dart';
import 'package:v_care/core/theme/colors_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<OnBoardingPage> _pages = [
    OnBoardingPage(
      image: AppImages.onBoarding1,
      title: 'Welcome to V-Care',
      subtitle: 'Your virtual healthcare assistant',
    ),
    OnBoardingPage(
      image: AppImages.onBoarding2,
      title: 'Book Appointments',
      subtitle: 'Book your doctor appointments with just a few clicks',
    ),
    OnBoardingPage(
      image: AppImages.onBoarding3,
      title: 'Track Your Health',
      subtitle: 'Track your medication, appointments and health records',
    ),
    OnBoardingPage(
      image: AppImages.onBoarding4,
      title: 'Stay Connected',
      subtitle: 'Stay connected with your doctor and receive personalized care',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h ,),
              child: AppLogoImageWidget(height: 80.h),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 30.0).w,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _pages[index];
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => buildDot(index),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage == _pages.length - 1) {
                          context.pushNamedAndRemoveUntil(
                            Routes.loginScreen,
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (_currentPage < _pages.length - 1)
                    TextButton(
                      onPressed: () {
                        context.pushNamedAndRemoveUntil(
                          Routes.loginScreen,
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: ColorsManager.mainBlue,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 8.h,
      width: _currentPage == index ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? ColorsManager.mainBlue
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
        Image.asset(image, height: 200.h, width: 200.w),
        const SizedBox(height: 40),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            overflow: TextOverflow.visible,
            height: 1.5,
            
          ),
            maxLines: 2,
            textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            height: 1.5,
            overflow: TextOverflow.visible,
         
          ),
             maxLines: 3,
            textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
