// To parse this JSON data, do
//
//     final getTransactionResponse = getTransactionResponseFromJson(jsonString);

import 'dart:convert';

GetTransactionResponse getTransactionResponseFromJson(String str) =>
    GetTransactionResponse.fromJson(json.decode(str));

String getTransactionResponseToJson(GetTransactionResponse data) =>
    json.encode(data.toJson());

class GetTransactionResponse {
  GetTransactionResponse({
    this.status,
    this.message,
    this.transaction,
  });

  final bool? status;
  final String? message;
  final Transaction? transaction;

  factory GetTransactionResponse.fromJson(Map<String, dynamic> json) =>
      GetTransactionResponse(
        status: json["status"],
        message: json["message"],
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromJson(json["transaction"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "transaction": transaction?.toJson(),
      };
}

class Transaction {
  Transaction({
    this.id,
    this.userId,
    this.referenceId,
    this.accountName,
    this.accountNumber,
    this.bankName,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? userId;
  final String? referenceId;
  final String? accountName;
  final dynamic accountNumber;
  final String? bankName;
  final int? amount;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        userId: json["user_id"],
        referenceId: json["reference_id"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
        amount: json["amount"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "reference_id": referenceId,
        "account_name": accountName,
        "account_number": accountNumber,
        "bank_name": bankName,
        "amount": amount,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
