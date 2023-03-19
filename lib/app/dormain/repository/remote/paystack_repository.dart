import 'package:banking_app/app/data/models/state.dart';
import 'package:dio/dio.dart';

abstract class PaystackRepository {
  Future<State> verifyBankAccount(String accountNumber, String bankCode,
      {Options? options});

  Future<State> getBanks(String country, {Options? options});
}
