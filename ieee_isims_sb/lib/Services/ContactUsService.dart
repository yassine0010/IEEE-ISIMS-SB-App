import 'dart:convert';

import 'package:ieee_isims_sb/models/ContactUsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<bool> Uploadticket(ContactUs ticket) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> TicketJson = ticket.toJson();

  String? loginValues = prefs.getString('loginValues');

  final url = Uri.parse('http://192.168.1.6:8080/ContactUs/Posting');

  try {
    http.Response response;

    if (loginValues == null) {
      print("is testinf");
      const String email = "test";
      const String password = "test";
      const credentials = '$email:$password';
      final encodedCredentials = base64Encode(utf8.encode(credentials));

      // Make the POST request
      response = await http.post(
        url,
        body: jsonEncode(TicketJson),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic $encodedCredentials',
        },
      );
    } else {

      response = await http.post(
        url,
        body: jsonEncode(TicketJson),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic $loginValues',
        },
      );
    }

    // Check the response status code
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed to upload ticket: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  } catch (e) {
    // Log the error for debugging
    print('Error occurred: $e');
    return false;
  }
}
