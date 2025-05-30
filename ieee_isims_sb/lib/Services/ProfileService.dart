import 'dart:convert';

import 'package:ieee_isims_sb/models/ProfileModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Profile?> GetUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? loginValues = prefs.getString('loginValues');
  final url = Uri.parse('http://51.255.172.143:8080/User/Read');
  try {
    final response =
        await http.get(url, headers: {"Authorization": 'Basic $loginValues'});
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final UserProfile = Profile.fromJson(jsonResponse);
      return UserProfile;
    }
  } on Exception {
    return null;
  }
  return null;
}
