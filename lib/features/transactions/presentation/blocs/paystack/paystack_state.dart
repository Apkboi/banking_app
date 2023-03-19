part of 'paystack_bloc.dart';

abstract class PaystackState extends Equatable {
  const PaystackState();
}

class PaystackInitial extends PaystackState {
  @override
  List<Object> get props => [];
}

class GetBanksLoadingState extends PaystackState {
  @override
  List<Object> get props => [];
}

class GetBanksSuccessState extends PaystackState {
  GetBanksResponse getBanksResponse;

  GetBanksSuccessState({required this.getBanksResponse});

  @override
  List<Object> get props => [];
}

class GetBanksFailureState extends PaystackState {
  String message;

  GetBanksFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

class VerifyAccountLoadingState extends PaystackState {
  @override
  List<Object> get props => [];
}

class VerifyAccountSuccessState extends PaystackState {
  VerifyAccountResponse verifyAccountResponse;

  VerifyAccountSuccessState(
      {required this.verifyAccountResponse, getBanksResponse});

  @override
  List<Object> get props => [verifyAccountResponse];
}

class VerifyAccountFailureState extends PaystackState {
  String message;

  VerifyAccountFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
