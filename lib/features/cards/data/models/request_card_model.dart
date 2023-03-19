// To parse this JSON data, do
//
//     final requestCardResponse = requestCardResponseFromJson(jsonString);

import 'dart:convert';

RequestCardResponse requestCardResponseFromJson(String str) => RequestCardResponse.fromJson(json.decode(str));

String requestCardResponseToJson(RequestCardResponse data) => json.encode(data.toJson());

class RequestCardResponse {
  RequestCardResponse({
    this.status,
    this.message,
    this.card,
  });

  final bool? status;
  final String? message;
  final Card? card;

  factory RequestCardResponse.fromJson(Map<String, dynamic> json) => RequestCardResponse(
    status: json["status"],
    message: json["message"],
    card: json["card"] == null ? null : Card.fromJson(json["card"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "card": card?.toJson(),
  };
}

class Card {
  Card({
    this.id,
    this.userId,
    this.cardNumber,
    this.cvv,
    this.expiryDate,
    this.cardPin,
    this.duressPin,
    this.cardType,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? userId;
  final String? cardNumber;
  final String? cvv;
  final String? expiryDate;
  final dynamic cardPin;
  final dynamic duressPin;
  final dynamic cardType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    id: json["id"],
    userId: json["user_id"],
    cardNumber: json["card_number"],
    cvv: json["cvv"],
    expiryDate: json["expiry_date"],
    cardPin: json["card_pin"],
    duressPin: json["duress_pin"],
    cardType: json["card_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "card_number": cardNumber,
    "cvv": cvv,
    "expiry_date": expiryDate,
    "card_pin": cardPin,
    "duress_pin": duressPin,
    "card_type": cardType,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
