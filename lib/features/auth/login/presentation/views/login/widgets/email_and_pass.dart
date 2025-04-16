import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care/core/helpers/sapcing.dart';
import 'package:v_care/core/theme/colors_manager.dart';
import 'package:v_care/core/widgets/app_text_form_field.dart';

import '../../../../../../../core/helpers/app_regex.dart';
import '../../../../logic/cubit/login_cubit.dart';
import 'password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  bool _obscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isEmailValid = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            email(context),
            hSpace(24),
            password(context),
            hSpace(24),
            PasswordValidation(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialChar: hasSpecialChar,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
          ],
        ));
  }

  AppTextFormField password(BuildContext context) {
    return AppTextFormField(
      hintText: 'Password',
      controller: context.read<LoginCubit>().passwordController,
      isObscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: ColorsManager.mainBlue,
        ),
        onPressed: _togglePasswordVisibility,
      ),
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      backgroundColor: ColorsManager.lighterGray,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
    );
  }

  AppTextFormField email(BuildContext context) {
    return AppTextFormField(
      hintText: 'Email',
      inputTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.gray,
      ),
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      controller: context.read<LoginCubit>().emailController,
      validator: (value) {
        if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
          return 'Please enter valid email';
        }
        return null;
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      backgroundColor: ColorsManager.moreLightGray,
    );
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.isLowerCase(passwordController.text);
        hasUpperCase = AppRegex.isUpperCase(passwordController.text);
        hasSpecialChar = AppRegex.isSpecialChar(passwordController.text);
        hasNumber = AppRegex.isNumber(passwordController.text);
        hasMinLength = AppRegex.isMinLength(passwordController.text);
      });
    });
  }
}
