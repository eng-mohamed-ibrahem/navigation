import 'package:navigation/model/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  final SharedPreferences pref;
  late User _user;

  SharedPrefController({required this.pref}) {
    _getUser();
  }

  /// wait until user is get, to can make check on its attributes
  _getUser() async {
    await Future(() => {User.fromJson(jsonUser: pref.getString(_getKey())!)})
        .then((value) => _user = value.first);
  }

  String _getKey() {
    return pref.getKeys().first;
  }

  bool checkEmail(String? email) {
    return _user.email == email;
  }

  bool checkPassword(String? password) {
    return _user.password == password;
  }

  Future<bool> clearData() {
    return pref.clear();
  }

  
}
