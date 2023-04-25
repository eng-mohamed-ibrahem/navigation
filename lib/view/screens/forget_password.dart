import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/view/components/customized_edit_form_text.dart';

import '../../model/utility/utility_methods.dart';

class ForgetPassword extends HookConsumerWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController phController = useTextEditingController();
    final GlobalKey<FormState> globalKey =
        useMemoized(() => GlobalKey<FormState>());
    CountryCode? displayCode;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Form(
        key: globalKey,
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
                      displayCode = value;
                    },
                    showDropDownButton: true,
                    favorite: const ['EG', 'US'],
                    initialSelection: 'EG',
                    onChanged: (value) {
                      displayCode = value;
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
                if (globalKey.currentState!.validate()) {
                  // send otp authentication
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      width: 300,
                      behavior: SnackBarBehavior.floating,
                      padding: const EdgeInsets.all(15),
                      content: Center(
                        child: Text(
                            'sent code to ${displayCode!.dialCode} - ${phController.text}'),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
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
