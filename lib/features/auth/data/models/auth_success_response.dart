
import 'dart:convert';

AuthSuccessResponse registrationResponseFromJson(String str) => AuthSuccessResponse.fromJson(json.decode(str));

String registrationResponseToJson(AuthSuccessResponse data) => json.encode(data.toJson());

class AuthSuccessResponse {
  AuthSuccessResponse({
    required this.status,
    required this.message,
    required this.profile,
  });

  final bool status;
  final String message;
  final Profile profile;

  AuthSuccessResponse copyWith({
    bool? status,
    String? message,
    Profile? profile,
  }) =>
      AuthSuccessResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        profile: profile ?? this.profile,
      );

  factory AuthSuccessResponse.fromJson(Map<String, dynamic> json) => AuthSuccessResponse(
    status: json["status"],
    message: json["message"],
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "profile": profile.toJson(),
  };
}

class Profile {
  Profile({
    required this.id,
    required this.dateOfBirth,
    required this.address,
    required this.apiToken,
    required this.phone,
    required this.profileableId,
    required this.profileableType,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.fullname,
    required this.username,
    required this.bvn,
    required this.accountNumber,
    required this.passcode,
    required this.transactionPin,
    required this.duressPin,
    required this.completedProfile,
    required this.walletBalance,
  });

  final String id;
  final DateTime dateOfBirth;
  final String address;
  final String apiToken;
  final String phone;
  final String profileableId;
  final String profileableType;
  final String email;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String fullname;
  final String username;
  final String bvn;
  final String accountNumber;
  final dynamic passcode;
  final dynamic transactionPin;
  final dynamic duressPin;
  final int completedProfile;
  final int walletBalance;

  Profile copyWith({
    String? id,
    DateTime? dateOfBirth,
    String? address,
    String? apiToken,
    String? phone,
    String? profileableId,
    String? profileableType,
    String? email,
    dynamic emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? fullname,
    String? username,
    String? bvn,
    String? accountNumber,
    dynamic passcode,
    dynamic transactionPin,
    dynamic duressPin,
    int? completedProfile,
    int? walletBalance,
  }) =>
      Profile(
        id: id ?? this.id,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        address: address ?? this.address,
        apiToken: apiToken ?? this.apiToken,
        phone: phone ?? this.phone,
        profileableId: profileableId ?? this.profileableId,
        profileableType: profileableType ?? this.profileableType,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        fullname: fullname ?? this.fullname,
        username: username ?? this.username,
        bvn: bvn ?? this.bvn,
        accountNumber: accountNumber ?? this.accountNumber,
        passcode: passcode ?? this.passcode,
        transactionPin: transactionPin ?? this.transactionPin,
        duressPin: duressPin ?? this.duressPin,
        completedProfile: completedProfile ?? this.completedProfile,
        walletBalance: walletBalance ?? this.walletBalance,
      );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    address: json["address"],
    apiToken: json["api_token"],
    phone: json["phone"],
    profileableId: json["profileable_id"],
    profileableType: json["profileable_type"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    fullname: json["fullname"],
    username: json["username"],
    bvn: json["bvn"],
    accountNumber: json["account_number"],
    passcode: json["passcode"],
    transactionPin: json["transaction_pin"],
    duressPin: json["duress_pin"],
    completedProfile: json["completed_profile"],
    walletBalance: json["wallet_balance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "address": address,
    "api_token": apiToken,
    "phone": phone,
    "profileable_id": profileableId,
    "profileable_type": profileableType,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "fullname": fullname,
    "username": username,
    "bvn": bvn,
    "account_number": accountNumber,
    "passcode": passcode,
    "transaction_pin": transactionPin,
    "duress_pin": duressPin,
    "completed_profile": completedProfile,
    "wallet_balance": walletBalance,
  };
}
