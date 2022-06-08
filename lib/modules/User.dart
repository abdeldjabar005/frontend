import 'package:flutter/foundation.dart';

class UserModel {
  late int id;
  late int role_id;
  late String firstName;
  late String lastName;
  late String companyName;
  late String registrationNumber;
  late String email;
  late String bio;
  late String phone;
  late String token;
  late String picture;

  UserModel({
    required this.id,
    required this.role_id,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.registrationNumber,
    required this.email,
    required this.bio,
    required this.phone,
    required this.token,
    required this.picture,
  });

  UserModel.fromJson(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    role_id = map['role_id'] ?? 0;
    firstName = map['first_name'] ?? '';
    lastName = map['last_name'] ?? '';
    companyName = map['agency_name'] ?? '';
    registrationNumber = map['registrationNumber'] ?? '';
    email = map['email'] ?? '';
    bio = map['bio'] ?? '';
    phone = map['phone'] ?? '';
    picture = map['picture'] ?? '';
    token = map['token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_id': role_id,
      'first_name': firstName,
      'last_Name': lastName,
      'companyName': companyName,
      'registrationNumber': registrationNumber,
      'email': email,
      'phone': phone,
      'picture': picture,
      'token': token,
    };
  }
}
// import 'dart:convert';

// class User {
//   final String firstName;
//   final String lastName;
//   final String companyName;
//   final String registrationNumber;
//   final String email;
//   final String phone;
//   User({
//      required this.firstName,
//     required this.lastName,
//     required this.companyName,
//     required this.registrationNumber,
//     required this.email,
//     required this.phone,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//      'firstName': firstName,
//       'lastName': lastName,
//       'companyName':companyName,
//       'registrationNumber':registrationNumber,
//       'email': email,
//       'phone': phone,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       firstName : map['firstName'],
//     lastName : map['lastName'],
//     companyName : map['companyName'],
//     registrationNumber : map['registrationNumber'],
//     email : map['email'],
//     phone : map['phone'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) => User.fromMap(json.decode(source));
// }
