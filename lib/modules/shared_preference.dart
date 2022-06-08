import 'dart:convert';

import 'package:xy2/modules/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setId(int value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setInt('id', value);
}

Future<int?> getid() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt("id");
}


Future<bool> setname(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Name', value);
}

Future<String?> getname() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("name");
}
Future<bool> setEmail(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('email', value);
}

Future<String?> getEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("email");
}

Future<bool> setPic(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('pic', value);
}

Future<String?> getPic() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("pic");
}

Future<bool> setPhone(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('phone', value);
}

Future<String?> getPhone() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("phone");
}


Future<bool> setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('token', value);
}

Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("token");
}
