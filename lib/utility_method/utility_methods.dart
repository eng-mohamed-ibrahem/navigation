import 'dart:developer';


String? emailValidated(String? input) {
  if (input!.isEmpty) {
    return 'Email cannot be left blank';
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input)) {
    return 'Enter a valid Email';
  }
  return null;
}

String? passwordValidated(String? password) {
  if(password!.isEmpty){
    return 'Password cannot be left blank';
  }else if(password.length < 8){
      return 'Password must be at least 8 characters';
  }
   return null;
}

String? phoneValidated(String? phone) {
  if (phone!.isEmpty) {
    return 'Phone cannot be left blank';
  } else if (phone.length != 11) {
    log('--- ${phone.length}');
    return 'Phone must be 11 digits';
  }
  return null;
}
