import 'package:flutter/material.dart';
import 'package:navigation/model/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  final SharedPreferences _pref;
  late User? _user;

  SharedPrefController({required SharedPreferences pref}) : _pref = pref;

  // User? get getUser => _user; // error has not been initialized

  /// wait until user is get, to can make check on its attributes
  Future<User?> getUser() async {
    try {
      await Future(() {
        if (_pref.getString('user') == null) {
          return null;
        } else {
          return User.fromJson(jsonUser: _pref.getString('user')!);
        }
      }).then((value) {
        return value;
      });
    } catch (e) {
      debugPrint('there is problem in bringing data from shared preference');
    }
    return null;
  }

  Future<bool> checkEmail(String? email) async {
    _user = await getUser();
    if (_user != null) {
      return _user!.email == email;
    } else {
      return false;
    }
  }

  Future<bool> checkPassword(String? password) async {
    _user = await getUser();

    if (_user != null) {
      return _user!.password == password;
    } else {
      return false;
    }
  }

  Future<bool> clearData() {
    return _pref.clear();
  }
}
