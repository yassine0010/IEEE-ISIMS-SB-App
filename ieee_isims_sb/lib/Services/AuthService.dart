import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(
  TextEditingController EmailController,
  TextEditingController PasswordController,
) async {
  final url = Uri.parse('http://51.255.172.143:8080/User/Read');

  final String email = EmailController.text;
  final String password = PasswordController.text;
  final credentials = '$email:$password';
  final encodedCredentials = base64Encode(utf8.encode(credentials));
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String loginValues = prefs.getString("loginValues") ?? "";
  bool isSignin = prefs.getBool("is_SignIn") ?? false;

  if (isSignin == true) {
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
        // await saveUserToken();
        prefs.setString("userData", response.body);
        prefs.setBool('is_SignIn', true);
        prefs.setString('loginValues', encodedCredentials);

        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
  return false;
}
