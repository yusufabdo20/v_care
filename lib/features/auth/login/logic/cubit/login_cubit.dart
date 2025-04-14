import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:v_care/features/auth/login/data/models/login_request_body.dart';

import '../../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    //thhe type of the response is ApiResult<LoginResponseModel>
    // ApiResult<LoginResponseModel> response = await _loginRepo.login(loginRequestBody);

    response.when(
      // response.when is a method from ###ApiResult### that takes two callbacks: one for success and one for failure.
      // It is used to handle the response of the API call and emit the appropriate state based on the result.
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.failure(
          message: error.apiErrorModel.message,
        ));
      },
    );
  }
}
