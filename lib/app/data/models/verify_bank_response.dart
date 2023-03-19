// To parse this JSON data, do
//
//     final verifyAccountResponse = verifyAccountResponseFromJson(jsonString);

import 'dart:convert';

VerifyAccountResponse verifyAccountResponseFromJson(String str) => VerifyAccountResponse.fromJson(json.decode(str));

String verifyAccountResponseToJson(VerifyAccountResponse data) => json.encode(data.toJson());

class VerifyAccountResponse {
  VerifyAccountResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory VerifyAccountResponse.fromJson(Map<String, dynamic> json) => VerifyAccountResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.accountNumber,
    required this.accountName,
    required this.bankId,
  });

  String accountNumber;
  String accountName;
  int bankId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accountNumber: json["account_number"],
    accountName: json["account_name"],
    bankId: json["bank_id"],
  );

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "account_name": accountName,
    "bank_id": bankId,
  };
}
