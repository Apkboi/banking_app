import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/features/transactions/data/models/save_transaction_payload.dart';

abstract class TransactionRepository {
  Future<State> getTransactions();
  Future<State> getTransaction(String transId);

  Future<State> saveTransaction(SaveTransactionPayload payload);

  Future<State> fetchUserData();

  Future<State> verifyTransaction(String code,String transId);

  Future<State> verifyP2PTransaction(String code,String transId);

  Future<State> saveP2PTransaction(SaveTransactionPayload payload);
}
