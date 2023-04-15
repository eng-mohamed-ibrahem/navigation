import 'package:flutter/material.dart';
import 'package:navigation/model/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  final SharedPreferences _pref;
  late User? _user;

  SharedPrefController({required SharedPreferences pref}) : _pref = pref;

  Future<User?> getUser() async {
    try {
      await Future(() {
        if (!_pref.getKeys().contains('user')) {
          return null; // result of future execution
        } else {
          return User.fromJson(jsonUser: _pref.getString('user')!);
        }
      }).then((value) => _user = value); // value get from return value
    } catch (e) {
      debugPrint(
          '----------- there is problem in bringing data from shared preference');
    }
    return _user;
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
