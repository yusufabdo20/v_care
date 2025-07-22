import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care/core/helpers/extentions/navigate_extention.dart';
import 'package:v_care/core/routes/app_router.dart';

import '../../../../../../../core/routes/routes.dart';
import '../../../../logic/cubit/login_cubit.dart';
import '../../../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
          success: (loginResponse) {
            // Handle success state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login successful: $loginResponse')),
            );
              context.pop() ; 
            context.pushNamed(Routes.homeScreen);
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
                const Text('An error occurred during login.'),
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
}
