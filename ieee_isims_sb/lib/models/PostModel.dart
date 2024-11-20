// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  int? id;
  dynamic title;
  String? postOwner;
  dynamic postContent;
  String? formLink;
  Uint8List? image;
  DateTime? postDate;
  dynamic postDeadline;

  Post({
    this.id,
    required this.title,
    this.postOwner,
    required this.postContent,
    this.formLink,
    this.image,
    this.postDate,
    this.postDeadline,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        postOwner: json["postOwner"],
        postContent: json["postContent"],
        formLink: json["formLink"],
        image:
            json["image"] != null ? base64Decode(json["image"]) : Uint8List(0),
        postDate: DateTime.parse(json["postDate"]),
        postDeadline: json["postDeadline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "postOwner": postOwner,
        "postContent": postContent,
        "formLink": formLink,
        "image": image != null ? base64Encode(image!) : null,
        "postDate": postDate?.toIso8601String(),
        "postDeadline": postDeadline,
      };
}
