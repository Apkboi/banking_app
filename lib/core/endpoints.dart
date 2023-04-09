import 'constants/constants.dart';

class AuthorizationEndpoints {
  static const String registration = '${Constants.baseUrl}/api/user/register';
  static const String login = '${Constants.baseUrl}/api/login';
  static const String setTransactionPin =
      '${Constants.baseUrl}/api/user/set/transaction-pin';
  static const String setDuressPin =
      '${Constants.baseUrl}/api/user/set/duress-pin';
  static const String setPasscode =
      '${Constants.baseUrl}/api/user/set/passcode';
}

class TransactionEndpoints {
  static const String transactions =
      '${Constants.baseUrl}/api/user/transactions';

  static const String p2PTransaction = '${Constants.baseUrl}/api/user/p2p';

  static const String verifyTransaction =
      '${Constants.baseUrl}/api/user/transactions/complete/';

  static const String verifyP2PTransaction =
      '${Constants.baseUrl}/api/user/p2p/complete/';

  static const String fetchUserData = '${Constants.baseUrl}/api/user/p2p';
}

class CardEndpoints {
  static const String requestCard =
      '${Constants.baseUrl}/api/user/card/request';
  static const String setCardPin =
      '${Constants.baseUrl}/api/user/card/card-pin';
  static const String setCardDuressPin =
      '${Constants.baseUrl}/api/user/card/duress-pin';
  static const String deleteCard =
      '${Constants.baseUrl}}/api/user/card/delete/';
  static const String getCard = '${Constants.baseUrl}/api/user/card';
}
