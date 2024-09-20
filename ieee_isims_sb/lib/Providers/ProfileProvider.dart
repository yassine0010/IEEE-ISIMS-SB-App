import 'package:flutter/material.dart';
import 'package:ieee_isims_sb/Services/ProfileService.dart';
import 'package:ieee_isims_sb/models/ProfileModel.dart';

class ProfileProvider with ChangeNotifier {
  bool isload = true;
  Profile? UserProfile;
  getDetails() async {
    UserProfile = await GetUser();
    print(UserProfile?.ieeePassword);
    isload = false;
    notifyListeners();
  }
}
