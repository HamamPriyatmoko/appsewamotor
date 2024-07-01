import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _name = '';
  String _profilePicture = '';

  String get name => _name;
  String get profilePicture => _profilePicture;

  void setUsername(String name) {
    _name = name;
    notifyListeners();
  }

  void setProfilePicture(String profilePicture) {
    _profilePicture = profilePicture;
    notifyListeners();
  }
}
