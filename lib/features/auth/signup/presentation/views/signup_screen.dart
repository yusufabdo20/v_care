import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care/core/helpers/sapcing.dart';
import 'package:v_care/core/widgets/app_text_form_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16).w,
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
                color: Colors.grey,
              ),
            ),
            hSpace(20),
            // Add your signup form fields here
            AppTextFormField(
              hintText: "name",
              validator: (value) {},
            ),
            AppTextFormField(
              hintText: "email",
              validator: (value) {},
            ),
            AppTextFormField(
              hintText: "phone number",
              validator: (value) {},
            ),
            AppTextFormField(
              hintText: "password",
              isObscureText: true,
              validator: (value) {},
            ),
            AppTextFormField(
              hintText: "confirm password",
              isObscureText: true,
              validator: (value) {},
            ),

          ],
        ),
      )),
    );
  }
}
