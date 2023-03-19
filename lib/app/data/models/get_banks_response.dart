// To parse this JSON data, do
//
//     final getBanksResponse = getBanksResponseFromJson(jsonString);

import 'dart:convert';

GetBanksResponse getBanksResponseFromJson(String str) =>
    GetBanksResponse.fromJson(json.decode(str));

String getBanksResponseToJson(GetBanksResponse data) =>
    json.encode(data.toJson());

class GetBanksResponse {
  GetBanksResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Bank> data;

  factory GetBanksResponse.fromJson(Map<String, dynamic> json) =>
      GetBanksResponse(
        status: json["status"],
        message: json["message"],
        data: List<Bank>.from(json["data"].map((x) => Bank.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Bank {
  Bank({
    required this.name,
    required this.slug,
    required this.code,
    required this.longcode,
    this.gateway,
    required this.payWithBank,
    required this.active,
    this.isDeleted,
    required this.country,
    required this.currency,
    required this.type,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  String name;
  String slug;
  String code;
  String longcode;
  String? gateway;
  bool payWithBank;
  bool active;
  bool? isDeleted;
  String country;
  String currency;
  String type;
  int id;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        longcode: json["longcode"],
        gateway: json["gateway"] ?? null,
        payWithBank: json["pay_with_bank"],
        active: json["active"],
        isDeleted: json["is_deleted"],
        country: json["country"],
        currency: json["currency"],
        type: json["type"],
        id: json["id"],
        createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) :null,
        updatedAt:json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) :null ,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "code": code,
        "longcode": longcode,
        "gateway": gateway ?? null,
        "pay_with_bank": payWithBank,
        "active": active,
        "is_deleted": isDeleted ?? null,
        "country": country,
        "currency": currency,
        "type": type,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
