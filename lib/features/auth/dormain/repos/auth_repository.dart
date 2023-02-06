import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/features/auth/data/models/register_payload.dart';

abstract class AuthRepository {
  Future<State> register(RegisterPayload payload);
  Future<State> login(String email, String password);
  Future<State> setTransactionPin(String transactionPin);
  Future<State> setDuressPin(String duressPin);
  Future<State> setPassCode(String passcode);
}
