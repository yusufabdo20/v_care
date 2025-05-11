import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care/core/helpers/extentions/navigate_extention.dart';
import 'package:v_care/core/routes/app_router.dart';
import 'package:v_care/features/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:v_care/features/auth/signup/logic/cubit/sign_up_state.dart';

import '../../../../../../../core/routes/routes.dart';


class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (_, state) {
        return state is Loading || state is Success || state is Failure;
      },
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show loading indicator
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Loading...')),
            );
          },
          success: (signUpResponse) {
            // Handle success state
          setupSuccessState(context) ;
          },
          failure: (error) {
            setupErrorState(context, error);
           
          },
        );
      },
      child: SizedBox.shrink(), // Replace with your actual widget tree
    );
  }

  Future<dynamic> setupErrorState(BuildContext context, String error) {
    return showDialog(context: context, builder: (_) => AlertDialog(
            title: const Text('Error occurred'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error, color: Colors.red),
                const Text('An error occurred during SignUp.'),
                Text(error.toString()),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          ));
  }
  Future<dynamic> setupSuccessState(BuildContext context) {
    return showDialog(context: context, builder: (_) => AlertDialog(
            title: const Text('Congratulations!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                const Text('Congratulations! You have successfully signed up.'),
              
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          ));
  }
}
