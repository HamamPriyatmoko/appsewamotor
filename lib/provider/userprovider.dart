import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _name = '';
  String _profilePicture = '';
  String _phoneNumber = '';
  String _gender = '';

  String get name => _name;
  String get profilePicture => _profilePicture;
  String get phoneNumber => _phoneNumber;
  String get gender => _gender;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setProfilePicture(String profilePicture) {
    _profilePicture = profilePicture;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  // Metode untuk mengupdate semua atribut profil sekaligus
  void updateProfile({
    required String name,
    required String profilePicture,
    required String phoneNumber,
    required String gender,
  }) {
    setName(name);
    setProfilePicture(profilePicture);
    setPhoneNumber(phoneNumber);
    setGender(gender);
  }
}
