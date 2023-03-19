// To parse this JSON data, do
//
//     final getTransactionResponse = getTransactionResponseFromJson(jsonString);

import 'dart:convert';

import 'package:banking_app/features/transactions/data/models/get_transaction_response.dart';

AllTransactionsResponse getTransactionResponseFromJson(String str) =>
    AllTransactionsResponse.fromJson(json.decode(str));

String getTransactionResponseToJson(AllTransactionsResponse data) =>
    json.encode(data.toJson());

class AllTransactionsResponse {
  AllTransactionsResponse({
    this.status,
    this.message,
    this.transactions,
  });

  final bool? status;
  final String? message;
  final List<Transaction>? transactions;

  factory AllTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      AllTransactionsResponse(
        status: json["status"],
        message: json["message"],
        transactions: json["transactions"] == null
            ? []
            : List<Transaction>.from(
                json["transactions"]!.map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}


