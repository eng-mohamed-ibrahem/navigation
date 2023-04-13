import 'package:flutter/material.dart';
// import  'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Image.asset(
            '../assets/images/flutter_image.jpg',
            height: 150,
          ),
          const SizedBox(
            height: 30,
          ),
          CountryCodePicker(
            
            showDropDownButton: true,
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: const ['+39', 'FR'],
                countryFilter: const ['IT', 'FR'],
                showFlagDialog: false,
                comparator: (a, b) => b.name!.compareTo(a.name!),
                //Get the country information relevant to the initial selection
                onInit: (code) => debugPrint(
                    "on init ${code!.name} ${code.dialCode} ${code.name}"),
              )
        ],
      ),
    );
  }
}
