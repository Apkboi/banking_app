import 'dart:convert';

// RegisterPayload registerPayloadFromJson(String str) =>
//     RegisterPayload.fromJson(json.decode(str));

String registerPayloadToJson(RegisterPayload data) =>
    json.encode(data.toJson());

class RegisterPayload {
  RegisterPayload();

  String fullname = '';
  String username = '';
  String email= '';
  String phone= '';
  String bvn= '';
  DateTime dateOfBirth= DateTime.now();
  String address='';
  String password = '';

  // factory RegisterPayload.fromJson(Map<String, dynamic> json) =>
  //     RegisterPayload(
  //       fullname: json["fullname"],
  //       username: json["username"],
  //       email: json["email"],
  //       phone: json["phone"],
  //       bvn: json["bvn"],
  //       dateOfBirth: DateTime.parse(json["date_of_birth"]),
  //       address: json["address"],
  //       password: json["password"],
  //     );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "username": username,
        "email": email,
        "phone": phone,
        "bvn": bvn,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "address": address,
        "password": password,
      };
}
