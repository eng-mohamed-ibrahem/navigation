import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:navigation/view/screens/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(List<String> args) {
  runApp(
     const MaterialApp(
      supportedLocales: [Locale('ar'), Locale('en')],
      localizationsDelegates: [
    CountryLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
      title: 'Navigation',
      home: Login(),
    ),
  );
}
