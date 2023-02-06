import 'constants/constants.dart';

class AuthorizationEndpoints {
  static const String registration = '${Constants.baseUrl}/api/user/register';
  static const String login = '${Constants.baseUrl}/api/login';
  static const String setTransactionPin = '${Constants.baseUrl}/api/user/set/transaction-pin';
  static const String setDuressPin = '${Constants.baseUrl}/api/user/set/duress-pin';
  static const String setPasscode = '${Constants.baseUrl}/api/user/set/passcode';
}
