import 'package:flutter/material.dart';

class User {
  String firstname;
  String lastname;
  String email;
  String phone;
  String userimage;

  User(
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.userimage,
  );
}

class Userinfo {
  User myuser = User(
    "User",
    "Name",
    "username@gmail.com",
    "0675915949",
    "assets/images/owner.jpg",
  );
}
