import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/signup_request_body.dart';
import '../../data/repo/signup_repo.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());
  final SignUpRepo _signUpRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Method to emit different states based on the sign-up process
  void emitSignUpStates() async {
    emit(SignUpState.loading());
    final  response = await _signUpRepo.signUp(
      SignUpRequestBody(
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: "0"
      ),
    );
    response.when(
      success: (data) {
        emit(SignUpState.success(data));
      },
      failure: (error) {
        emit(SignUpState.failure(
          message: error.apiErrorModel.message,
        ));
      },
    );
  }


}
