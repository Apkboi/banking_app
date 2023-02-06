part of 'auths_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthsInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthState {
  final AuthSuccessResponse response;

  const LoginSuccessState(this.response);

  @override
  List<Object?> get props => [response];
}

class LoginLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccessState extends AuthState {
  final AuthSuccessResponse response;

  const RegisterSuccessState(this.response);

  @override
  List<Object?> get props => [response];
}

class AuthFailureState extends AuthState {
  final List<String> errors;

  const AuthFailureState(this.errors);

  @override
  List<Object?> get props => [errors];
}

class RegisterLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SetTransactionPinSuccessState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetTransactionPinFailureState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetTransactionPinLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SetDuressPinSuccessState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetDuressPinFailureState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetDuressPinLoadingState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetPasscodeSuccessState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetPasscodeFailureState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetPasscodeLoadingState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
