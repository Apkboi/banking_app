part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

class GetAllTransactionLoadingState extends TransactionState {
@override
List<Object?> get props => [];
}
class GetAllTransactionSucessState extends TransactionState {
  final AllTransactionsResponse response;

  const GetAllTransactionSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class GetAllTransactionFailureState extends TransactionState {
  final String error;

  @override
  List<Object?> get props => [];

  const GetAllTransactionFailureState(this.error);
}

class SaveTransactionLoadingState extends TransactionState {
  @override
  List<Object?> get props => [];
}
class SaveTransactionSucessState extends TransactionState {
  final GetTransactionResponse response;

  const SaveTransactionSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class SaveTransactionFailureState extends TransactionState {
  final String error;

  @override
  List<Object?> get props => [];

  const SaveTransactionFailureState(this.error);
}


class VerifyTransactionLoadingState extends TransactionState {
  @override
  List<Object?> get props => [];
}
class VerifyTransactionSucessState extends TransactionState {
  final VerifyTransactionResponse response;

  const VerifyTransactionSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class VerifyTransactionFailureState extends TransactionState {
  final String error;

  @override
  List<Object?> get props => [];

  const VerifyTransactionFailureState(this.error);
}

class GetTransactionLoadingState extends TransactionState {
  @override
  List<Object?> get props => [];
}
class GetTransactionSucessState extends TransactionState {
  final GetTransactionResponse response;

  const GetTransactionSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class GetTransactionFailureState extends TransactionState {
  final String error;

  @override
  List<Object?> get props => [];

  const GetTransactionFailureState(this.error);
}

class FetchUserLoadingState extends TransactionState {
  @override
  List<Object?> get props => [];
}
class FetchUserSucessState extends TransactionState {
  final FetchUsersResponse response;

  const FetchUserSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class FetchUserFailureState extends TransactionState {
  final String error;

  @override
  List<Object?> get props => [];

  const FetchUserFailureState(this.error);
}

class SaveP2PTransactionLoadingState extends TransactionState {
  @override
  List<Object?> get props => [];
}
class SaveP2PTransactionSucessState extends TransactionState {
  final GetTransactionResponse response;

  const SaveP2PTransactionSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class SaveP2PTransactionFailureState extends TransactionState {
  final String error;

  @override
  List<Object?> get props => [];

  const SaveP2PTransactionFailureState(this.error);
}


class VerifyP2PTransactionLoadingState extends TransactionState {
  @override
  List<Object?> get props => [];
}
class VerifyP2PTransactionSucessState extends TransactionState {
  final VerifyTransactionResponse response;

  const VerifyP2PTransactionSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class VerifyP2PTransactionFailureState extends TransactionState {
  final String error;

  @override
  List<Object?> get props => [];

  const VerifyP2PTransactionFailureState(this.error);
}

