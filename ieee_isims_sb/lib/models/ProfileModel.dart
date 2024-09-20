import 'dart:convert';



class Profile {
  String name;
  String email;
  String ieeeEmail;
  String ieeePassword;
  dynamic phoneNumber;
  dynamic membership;
  dynamic fssIsims;
  String role;
  String ieeeId;

  Profile({
    required this.name,
    required this.email,
    required this.ieeeEmail,
    required this.ieeePassword,
    required this.phoneNumber,
    required this.membership,
    required this.fssIsims,
    required this.role,
    required this.ieeeId,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        email: json["email"],
        ieeeEmail: json["ieeeEmail"],
        ieeePassword: json["ieeePassword"],
        phoneNumber: json["phoneNumber"],
        membership: json["membership"],
        fssIsims: json["fss_isims"],
        role: json["role"],
        ieeeId: json["ieee_ID"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "ieeeEmail": ieeeEmail,
        "ieeePassword": ieeePassword,
        "phoneNumber": phoneNumber,
        "membership": membership,
        "fss_isims": fssIsims,
        "role": role,
        "ieee_ID": ieeeId,
      };
}
