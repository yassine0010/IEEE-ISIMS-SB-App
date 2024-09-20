import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(
  TextEditingController EmailController,
  TextEditingController PasswordController,
) async {
  final url = await Uri.parse('http://192.168.0.113:8080/User/Read');

  final String _email = EmailController.text;
  final String _password = PasswordController.text;
  final credentials = '$_email:$_password';
  final encodedCredentials = base64Encode(utf8.encode(credentials));
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String loginValues = prefs.getString("loginValues") ?? "";
  bool is_SignIn = prefs.getBool("is_SignIn") ?? false;
  if (is_SignIn == true) {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Basic $loginValues',
      },
    );
    if (response.statusCode == 200) {
      return true;
    }
  } else {
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Basic $encodedCredentials',
        },
      );
      if (response.statusCode == 200) {
        prefs.setString("userData", response.body);
        prefs.setBool('is_SignIn', true);
        prefs.setString('loginValues', encodedCredentials);

        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
  return false;
}
