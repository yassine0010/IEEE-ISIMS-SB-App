import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getUserToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print("objecct");

  return token;
}

Future<void> saveUserToken() async {
  String? token = await FirebaseMessaging.instance.getToken();

  if (token != null) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    await databaseReference.child('users/tokens/').set(token);

    print("Token saved successfully: $token");
  } else {
    print("Failed to get token");
  }
}
