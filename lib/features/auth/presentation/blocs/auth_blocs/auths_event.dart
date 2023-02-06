part of 'auths_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class RegisterEvent extends AuthEvent {
  final RegisterPayload payload;

  const RegisterEvent(this.payload);

  @override
  List<Object?> get props => [payload];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SetDurresPinEvent extends AuthEvent {
  final RegisterPayload payload;

  const SetDurresPinEvent(this.payload);

  @override
  List<Object?> get props => [payload];
}

class SetTransactionPinEvent extends AuthEvent {
  final String pin;

  const SetTransactionPinEvent({required this.pin});

  @override
  List<Object?> get props => [pin];
}

class SetDuressPinEvent extends AuthEvent {
  final String duressPin;

  const SetDuressPinEvent({required this.duressPin});

  @override
  List<Object?> get props => [duressPin];
}

class SetPasscodeEvent extends AuthEvent {
  final String passcode;

  const SetPasscodeEvent({required this.passcode});

  @override
  List<Object?> get props => [passcode];
}
