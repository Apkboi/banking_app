import 'dart:async';
import 'dart:developer';

import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/core/constants/storage_keys.dart';
import 'package:banking_app/core/helpers/storage_helper.dart';
import 'package:banking_app/features/auth/data/models/auth_success_response.dart';
import 'package:banking_app/features/auth/data/models/register_payload.dart';
import 'package:banking_app/features/auth/dormain/repos/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auths_event.dart';

part 'auths_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  RegisterPayload registerPayload = RegisterPayload();

  AuthBloc(this.authRepository) : super(AuthsInitial()) {
    on<AuthEvent>((event, emit) {});

    on<RegisterEvent>(_mapRegistrationEventToState);
    on<LoginEvent>(_mapLoginEventToState);
    on<SetDuressPinEvent>(_mapSetDuressPinEventToState);
    on<SetTransactionPinEvent>(_mapSetTransactionPinEventToState);
    on<SetPasscodeEvent>(_mapSetPasscodeEventToState);
  }

  FutureOr<void> _mapRegistrationEventToState(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());

    try {
      State state = await authRepository.register(event.payload);
      if (state is SuccessState) {
        AuthSuccessResponse response = state.value;
        cacheToken(response.profile.apiToken);
        emit(RegisterSuccessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(AuthFailureState(errorModel.data??[errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const AuthFailureState(['Something went wrong please retry']));
    }
  }

  FutureOr<void> _mapLoginEventToState(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());

    try {
      State state = await authRepository.login(event.email, event.password);
      if (state is SuccessState) {
        AuthSuccessResponse response = state.value;
        cacheToken(response.profile.apiToken);
        emit(LoginSuccessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;

        emit(AuthFailureState(errorModel.data??[errorModel.errorMessage]));
      }
    } on Exception catch (e) {
      emit(const AuthFailureState(['Something went wrong please retry']));
    }
  }

  FutureOr<void> _mapSetTransactionPinEventToState(
      SetTransactionPinEvent event, Emitter<AuthState> emit) async {
    emit(SetTransactionPinLoadingState());

    try {
      State state = await authRepository.setTransactionPin(event.pin);
      if (state is SuccessState) {
        emit(SetTransactionPinSuccessState());
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(AuthFailureState(errorModel.data??[errorModel.errorMessage]));
      }
    } on Exception catch (e) {
      emit(const AuthFailureState(["Something went wrong please retry"]));
    }
  }

  FutureOr<void> _mapSetDuressPinEventToState(
      SetDuressPinEvent event, Emitter<AuthState> emit) async {
    emit(SetDuressPinLoadingState());

    try {
      State state = await authRepository.setDuressPin(event.duressPin);
      if (state is SuccessState) {
        emit(SetDuressPinSuccessState());
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(AuthFailureState(errorModel.data??[errorModel.errorMessage]));
      }
    } on Exception catch (e) {
      emit(const AuthFailureState(["Something went wrong please retry"]));
    }
  }

  FutureOr<void> _mapSetPasscodeEventToState(
      SetPasscodeEvent event, Emitter<AuthState> emit) async {
    emit(SetPasscodeLoadingState());

    try {
      State state = await authRepository.setPassCode(event.passcode);
      if (state is SuccessState) {
        emit(SetPasscodeSuccessState());
      } else if(state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(AuthFailureState(errorModel.data??[errorModel.errorMessage]));

      }
    } on Exception catch (e) {
      emit(const AuthFailureState(["Something went wrong please retry"]));

    }
  }

  void cacheToken(String token) {
    StorageHelper.setString(StorageKeys.token, token);
  }
}
