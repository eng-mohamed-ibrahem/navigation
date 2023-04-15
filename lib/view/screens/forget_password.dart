import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:navigation/view/components/customized_edit_form_text.dart';

import '../../model/utility_method/utility_methods.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController phController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  CountryCode? _displayCode;

  @override
  void dispose() {
    phController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Image.asset(
              'assets/images/flutter_image.jpg',
              // height: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(child: Text('Please Enter your number to send code')),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: CountryCodePicker(
                    onInit: (value) {
                      _displayCode = value;
                    },
                    showDropDownButton: true,
                    favorite: const ['EG', 'US'],
                    initialSelection: 'EG',
                    onChanged: (value) {
                      _displayCode = value;
                    },
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: CustomizedTextFormField(
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: phController,
                    validator: phoneValidated,
                    labelText: 'Phone',
                    maxLength: 11,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    prefixIcon: const Icon(Icons.call),
                    keyboardType: TextInputType.phone,
                  ),
                )
              ],
            ),
            // CountryCodePicker(
            //   showDropDownButton: true,
            //   onChanged: print,
            //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            //   initialSelection: 'IT',
            //   favorite: const ['+39', 'FR'],
            //   // countryFilter: const ['IT', 'FR'],
            //   showFlagDialog: false,
            //   comparator: (a, b) => b.name!.compareTo(a.name!),
            //   //Get the country information relevant to the initial selection
            //   onInit: (code) => debugPrint(
            //       "on init ${code!.name} ${code.dialCode} ${code.name}"),
            // )
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  // send otp authentication
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      padding: const EdgeInsets.all(10),
                      content: Text(
                          'sent code to ${_displayCode!.dialCode}-${phController.text}'),
                      dismissDirection: DismissDirection.down,
                    ),
                  );
                }
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
