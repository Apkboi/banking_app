// To parse this JSON data, do
//
//     final saveTransactionPayload = saveTransactionPayloadFromJson(jsonString);

import 'dart:convert';

SaveTransactionPayload saveTransactionPayloadFromJson(String str) =>
    SaveTransactionPayload.fromJson(json.decode(str));

String saveTransactionPayloadToJson(SaveTransactionPayload data) =>
    json.encode(data.toJson());

class SaveTransactionPayload {
  SaveTransactionPayload({
    this.accountName,
    this.accountNumber,
    this.bankName,
    this.amount,
    this.status,
    this.pin,
  });

  final String? accountName;
  final int? accountNumber;
  final String? bankName;
  final int? amount;
  final String? status;
  final String? pin;

  factory SaveTransactionPayload.fromJson(Map<String, dynamic> json) =>
      SaveTransactionPayload(
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
        amount: json["amount"],
        status: json["status"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "account_name": accountName,
        "account_number": accountNumber,
        "bank_name": bankName,
        "amount": amount,
        "status": status,
        "pin": pin,
      };
}
