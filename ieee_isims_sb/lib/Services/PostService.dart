import 'dart:convert';

import 'package:ieee_isims_sb/models/PostModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<Post>?> ReadAllPosts() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? loginValues = prefs.getString('loginValues');
  final url = Uri.parse('http://192.168.1.6:8080/Post/ReadAll');
  try {
    final response =
        await http.get(url, headers: {"Authorization": 'Basic $loginValues'});
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      final List<Post> postList =
          jsonResponse.map((data) => Post.fromJson(data)).toList();

      return postList;
    }
  } on Exception {
    return null;
  }
  return null;
}

Future<void> UploadPost(Post post) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> postJson = post.toJson();

  String? loginValues = prefs.getString('loginValues');
  final url = Uri.parse('http://192.168.1.6:8080/Post/Posting');
  try {
    final response = await http.post(url, body: jsonEncode(postJson), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Basic $loginValues',
    });
  } catch (e) {
    return;
  }
}

Future<void> UpdatePost(int id, Post post) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> postJson = post.toJson();

  String? loginValues = prefs.getString('loginValues');
  final url = Uri.parse('http://192.168.1.6:8080/Post/Update/$id');
  try {
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic $loginValues',
        },
        body: jsonEncode(postJson));
  } catch (e) {
    return;
  }
}

Future<void> DeletePost(int id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? loginValues = prefs.getString('loginValues');
  final url = Uri.parse('http://192.168.1.6:8080/Post/Delete/$id');
  try {
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Basic $loginValues',
    });
  } catch (e) {
    return;
  }
}
