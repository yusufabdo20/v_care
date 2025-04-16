import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care/core/helpers/sapcing.dart';
import 'package:v_care/core/theme/colors_manager.dart';
import 'package:v_care/core/widgets/app_text_button.dart';
import 'package:v_care/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:v_care/features/auth/login/presentation/views/login/widgets/email_and_pass.dart'
    show EmailAndPassword;

import '../../../data/models/login_request_body.dart';
import 'widgets/login_bloc_listener.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              hSpace(10),
              const Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.gray,
                ),
              ),

              hSpace(20),
              const EmailAndPassword(),
              hSpace(20),
              getForgotPasswordButton(),
              hSpace(20),
              getLoginButton(context),
              hSpace(20),
              const Text(
                'Or',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.gray,
                ),
              ),
              // dont have account ?  SignUpButton
              getSignUpButton(),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  Align getForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: AppTextButton(
        buttonText: "Forgot Password?",
        textStyle: TextStyle(
          color: ColorsManager.mainBlue,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: Colors.transparent,
        horizontalPadding: 0,
        verticalPadding: 0,
        buttonWidth: double.infinity,
        onPressed: () {},
      ),
    );
  }

  SizedBox getSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: AppTextButton(
        buttonText: "Don't have an account? Sign Up",
        textStyle: TextStyle(
          color: ColorsManager.mainBlue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent,
        horizontalPadding: 0,
        verticalPadding: 0,
        buttonWidth: double.infinity,
        onPressed: () {},
      ),
    );
  }

  SizedBox getLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppTextButton(
          buttonText: "Login",
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: ColorsManager.mainBlue,
          horizontalPadding: 20,
          verticalPadding: 10,
          buttonHeight: 50,
          buttonWidth: double.infinity,
          onPressed: () {
            validateThenLogin(context);
          }),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          ));
      // Proceed with login logic
    } else {
      // Show validation error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields correctly.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
