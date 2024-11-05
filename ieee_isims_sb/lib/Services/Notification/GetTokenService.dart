import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getUserToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
}
