import 'dart:convert';

class User {

  final String? name;
  final String? phone;
  final String? email;
  final String? lifeStory;
  final String? password;
  final num? salary;
  
  User(
      {required this.email,
      required this.lifeStory,
      required this.name,
      required this.phone,
      required this.password,
      required this.salary});

  Map<String, dynamic> _toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'life_story': lifeStory,
      'salary': salary,
      'password': password
    };
  }

  factory User.fromJson({required String jsonUser}) {
    Map<String, dynamic> user = jsonDecode(jsonUser);

    
    return User(
        name: user['name'],
        email: user['email'],
        phone: user['phone'],
        password: user['password'],
        salary: user['salary'],
        lifeStory: user['life_story']);
  }

  ///
  /// Convert the user object to json formate to save it in storage
  /// [_toJson] is a map which represent the user object
  /// [jsonEncode] from 'dart:convert' lib
  /// convert objec to json formate which store each value with its corresponding data type
  ///
  /// you can convert it toJson formate manually as following
  /// [$name] is a string value so describe it in '' and [$salary] is an int value describe it [int]
  ///
  ///```dart
  /// '{''name'': ''$name'', ''salary'': $salary}';
  ///```
  ///

  String toJson() => jsonEncode(_toJson());

  @override
  String toString() {
    return _toJson().toString();
  }
}
