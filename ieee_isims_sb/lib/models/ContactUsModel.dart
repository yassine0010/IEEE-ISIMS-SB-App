// To parse this JSON data, do
//
//     final contactUs = contactUsFromJson(jsonString);

import 'dart:convert';

ContactUs contactUsFromJson(String str) => ContactUs.fromJson(json.decode(str));

String contactUsToJson(ContactUs data) => json.encode(data.toJson());

class ContactUs {
  String cTitle;
  String cContent;

  ContactUs({
    required this.cTitle,
    required this.cContent,
  });

  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
        cTitle: json["ctitle"],
        cContent: json["ccontent"],
      );

  Map<String, dynamic> toJson() => {
        "ctitle": cTitle,
        "ccontent": cContent,
      };
}
