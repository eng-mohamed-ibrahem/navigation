import 'package:flutter/material.dart';
import 'package:navigation/model/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  final SharedPreferences _pref;
  late User? _user;

  SharedPrefController({required SharedPreferences pref}) : _pref = pref {
    _getUser();
  }

  User? get getUser => _user;

  /// wait until user is get, to can make check on its attributes
  _getUser() async {
    try {
      await Future(() {
        return User.fromJson(jsonUser: _pref.getString('user')!);
      }).then((value) {
        _user = value;
      });
    } on Exception catch (e) {
      debugPrint('there is problem in bringing data from shared preference');
    }
  }

  bool checkEmail(String? email) {
    return _user!.email == email;
  }

  bool checkPassword(String? password) {
    return _user!.password == password;
  }

  Future<bool> clearData() {
    return _pref.clear();
  }
}
