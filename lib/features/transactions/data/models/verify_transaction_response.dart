// To parse this JSON data, do
//
//     final verifyTransactionResponse = verifyTransactionResponseFromJson(jsonString);

import 'dart:convert';

import 'get_transaction_response.dart';

VerifyTransactionResponse verifyTransactionResponseFromJson(String str) => VerifyTransactionResponse.fromJson(json.decode(str));

String verifyTransactionResponseToJson(VerifyTransactionResponse data) => json.encode(data.toJson());

class VerifyTransactionResponse {
  VerifyTransactionResponse({
    this.status,
    this.message,
    this.transaction,
    this.user,
  });

  final bool? status;
  final String? message;
  final Transaction? transaction;
  final User? user;

  factory VerifyTransactionResponse.fromJson(Map<String, dynamic> json) => VerifyTransactionResponse(
    status: json["status"],
    message: json["message"],
    transaction: json["transaction"] == null ? null : Transaction.fromJson(json["transaction"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "transaction": transaction?.toJson(),
    "user": user?.toJson(),
  };
}



class User {
  User({
    this.id,
    this.fullname,
    this.username,
    this.bvn,
    this.accountNumber,
    this.passcode,
    this.transactionPin,
    this.duressPin,
    this.completedProfile,
    this.walletBalance,
    this.safeBalance,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String? id;
  final String? fullname;
  final String? username;
  final String? bvn;
  final String? accountNumber;
  final String? passcode;
  final String? transactionPin;
  final dynamic duressPin;
  final int? completedProfile;
  final int? walletBalance;
  final int? safeBalance;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullname: json["fullname"],
    username: json["username"],
    bvn: json["bvn"],
    accountNumber: json["account_number"],
    passcode: json["passcode"],
    transactionPin: json["transaction_pin"],
    duressPin: json["duress_pin"],
    completedProfile: json["completed_profile"],
    walletBalance: json["wallet_balance"],
    safeBalance: json["safe_balance"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "username": username,
    "bvn": bvn,
    "account_number": accountNumber,
    "passcode": passcode,
    "transaction_pin": transactionPin,
    "duress_pin": duressPin,
    "completed_profile": completedProfile,
    "wallet_balance": walletBalance,
    "safe_balance": safeBalance,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
