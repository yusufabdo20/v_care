import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.failure({required String message}) = Failure;
}
/* 
LoginState  is a state class that represents the different states of the login process.
It has four states:
1. initial: Represents the initial state before any action is taken.
2. loading: Represents the loading state when the login process is in progress.
3. success: Represents the success state when the login process is successful.
4. failure: Represents the failure state when the login process fails, with a message indicating the reason for the failure.
The LoginState class is used in the LoginCubit to manage the state of the login process.
The LoginCubit class is a state management class that extends the Cubit class from the flutter_bloc package. It manages the login process and emits different states based on the result of the login attempt. The LoginCubit class has a method called login that takes a LoginRequestBody object as a parameter and performs the login process. It emits different states based on the result of the login attempt, such as loading, success, or failure.
The LoginState class is used in the LoginCubit to manage the state of the login process. The LoginCubit class is a state management class that extends the Cubit class from the flutter_bloc package. It manages the login process and emits different states based on the result of the login attempt. The LoginCubit class has a method called login that takes a LoginRequestBody object as a parameter and performs the login process. It emits different states based on the result of the login attempt, such as loading, success, or failure.
LoginState.failure , LoginState.success ,LoginState.loading()   uses in Cubit 
Failure , Success , Loading  uses in UI and BlocBuild , build when , build . 
*/