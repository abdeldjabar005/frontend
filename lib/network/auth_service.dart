import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xy2/modules/User.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String baseUrl = 'http://192.168.43.171:8000/api';
  Map<String, String> headers = {"Content-Type": "application/json"};

  Future<http.Response> registerAgence(
    String companyName,
    String registrationNumber,
    String email,
    String phone,
    String password,
    String passwordConfirmation,
  ) async {
    Map data = {
      'agencyName': companyName,
      'registrationNumber': registrationNumber,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    print(data);
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/auth/registeragency');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;

  }

  Future<http.Response> registerClient(
    String firstName,
    String lastName,
    String email,
    String phone,
    String password,
    String passwordConfirmation,
  ) async {
    Map data = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    print(data);
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/auth/registerclient');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;

  }

  Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    print(data);
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/auth/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }
}
