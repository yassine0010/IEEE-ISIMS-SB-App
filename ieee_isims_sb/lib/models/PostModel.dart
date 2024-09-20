// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  int id;
  dynamic title;
  String postOwner;
  dynamic postContent;
  dynamic formLink;
  Uint8List image;
  DateTime postDate;
  dynamic postDeadline;

  Post({
    required this.id,
    required this.title,
    required this.postOwner,
    required this.postContent,
    required this.formLink,
    required this.image,
    required this.postDate,
    required this.postDeadline,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        postOwner: json["postOwner"],
        postContent: json["postContent"],
        formLink: json["formLink"],
        image: base64Decode(json["image"]),
        postDate: DateTime.parse(json["postDate"]),
        postDeadline: json["postDeadline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "postOwner": postOwner,
        "postContent": postContent,
        "formLink": formLink,
        "image": image,
        "postDate": postDate.toIso8601String(),
        "postDeadline": postDeadline,
      };
}
