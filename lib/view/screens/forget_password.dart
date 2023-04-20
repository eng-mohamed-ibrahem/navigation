import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:navigation/view/components/customized_edit_form_text.dart';

import '../../model/utility_method/utility_methods.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final GlobalKey<FormState> _globalKey =
      useMemoized(() => GlobalKey<FormState>());

  final TextEditingController phController = useTextEditingController();

  CountryCode? _displayCode;

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
                          'sent code to ${_displayCode!.dialCode} - ${phController.text}'),
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
