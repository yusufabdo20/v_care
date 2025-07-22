import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care/core/helpers/app_regex.dart';
import 'package:v_care/core/theme/colors_manager.dart';
import 'package:v_care/features/auth/login/presentation/views/login/widgets/password_validation.dart';
import 'package:v_care/features/auth/signup/logic/cubit/sign_up_cubit.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
import 'password_and_phone_validationn.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController passwordController;

  bool _obscureText = true;

  bool hasLowerCase = false;

  bool hasUpperCase = false;

  bool hasSpecialChar = false;

  bool hasNumber = false;

  bool hasMinLength = false;
  bool isPhoneNumberValid = false;

  bool isEmailValid = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    passwordController = context.read<SignUpCubit>().passwordController;
    setUpPasswordControllerListener();
    super.initState();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.isLowerCase(passwordController.text);
        hasUpperCase = AppRegex.isUpperCase(passwordController.text);
        hasSpecialChar = AppRegex.isSpecialChar(passwordController.text);
        hasNumber = AppRegex.isNumber(passwordController.text);
        hasMinLength = AppRegex.isMinLength(passwordController.text);
        isPhoneNumberValid = AppRegex.isPhoneNumberValid( context.read<SignUpCubit>().phoneController.text);
      });
    });
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,  
      child: Column(children: [
           AppTextFormField(
                hintText: "name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                controller: context.read<SignUpCubit>().nameController,
              ),
              AppTextFormField(
                hintText: "email",
                validator: (value) {
                  if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
                controller: context.read<SignUpCubit>().emailController,
              ),
              AppTextFormField(
                hintText: "phone number",
                validator: (value) {
                  if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
                controller: context.read<SignUpCubit>().phoneController,
              ),
              AppTextFormField(
                hintText: "password",
                isObscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },

                 suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ColorsManager.mainBlue,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                controller: context.read<SignUpCubit>().passwordController,
              ),
              AppTextFormField(
                hintText: "confirm password",
                isObscureText: _obscureText,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ColorsManager.mainBlue,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value != context.read<SignUpCubit>().passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                  controller: context.read<SignUpCubit>().passwordConfirmationController,
              ),
                  PasswordAndPhoneNumberValidation(
                    phone: isPhoneNumberValid,
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialChar: hasSpecialChar,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
      ],),
    );
  }
}