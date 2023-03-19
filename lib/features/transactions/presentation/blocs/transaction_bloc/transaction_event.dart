part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class GetAllTransactionsEvent extends TransactionEvent {
  @override
  List<Object?> get props => [];
}
class GetTransactionEvent extends TransactionEvent {
  final String transId;

  const GetTransactionEvent(this.transId);

  @override
  List<Object?> get props => [transId];
}
class VerifyTransactionEvent extends TransactionEvent {
  final String code;
  final String transId;

  const VerifyTransactionEvent(this.code,this.transId);

  @override
  List<Object?> get props => [transId];
}
class SaveTransactionEvent extends TransactionEvent {
  final SaveTransactionPayload payload;

  const SaveTransactionEvent(this.payload);

  @override
  List<Object?> get props => [payload];
}
class FetchUserDataEvent extends TransactionEvent {
  const FetchUserDataEvent();

  @override
  List<Object?> get props => [];
}

class VerifyP2PTransactionEvent extends TransactionEvent {
  final String transId;

  const VerifyP2PTransactionEvent(this.transId);

  @override
  List<Object?> get props => [transId];
}
class SaveP2PTransactionEvent extends TransactionEvent {
  final SaveTransactionPayload payload;

  const SaveP2PTransactionEvent(this.payload);

  @override
  List<Object?> get props => [payload];
}
