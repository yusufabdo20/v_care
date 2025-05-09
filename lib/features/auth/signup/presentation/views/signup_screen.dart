import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care/core/helpers/extentions/navigate_extention.dart';
import 'package:v_care/core/helpers/sapcing.dart';
import 'package:v_care/core/routes/routes.dart';
import 'package:v_care/core/theme/colors_manager.dart';
import 'package:v_care/core/widgets/app_text_button.dart';
import 'package:v_care/core/widgets/app_text_form_field.dart';
import 'package:v_care/features/auth/signup/presentation/widgets/sign_up_form.dart';
import 'package:v_care/features/auth/signup/presentation/widgets/signup_bloc_listner.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16).w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              hSpace(24),
              Text(
                'Sign up to get started',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              hSpace(20),
              // Add your signup form fields here
           SignUpForm(),
          getLoginButton(context), 
          SignUpBlocListener() , 
            ],
          ),
        ),
      )),
    );
  }
  SizedBox getLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppTextButton(
        buttonText: "Already have an account? Login",
        textStyle: TextStyle(
          color: ColorsManager.mainBlue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent,
        horizontalPadding: 0,
        verticalPadding: 0,
        buttonWidth: double.infinity,
        onPressed: () {
          context.pushNamed(Routes.signUpScreen);
        },
      ),
    );
  }
}
