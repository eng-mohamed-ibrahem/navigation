import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:navigation/view/screens/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/objects/user.dart';
import '../components/customized_edit_form_text.dart';
import '../../model/utility_method/utility_methods.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUptState();
}

class _SignUptState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController rePassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController storyController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final _globalFormKey = GlobalKey<FormState>();
  bool visibility = false;
  bool _isLoading = false;
  late SharedPreferences _preferences;
  late User? _user;

  @override
  void didChangeDependencies() async {
    _preferences = await SharedPreferences.getInstance();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameController.dispose();
    phController.dispose();
    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
    storyController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Form(
        key: _globalFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomizedTextFormField(
                controller: nameController,
                validator: (name) {
                  if (name!.isEmpty) {
                    return 'Name cannot be left Blank';
                  }
                  return null;
                },
                labelText: 'Name',
                prefixIcon: const Icon(Icons.person_2_outlined),
                keyboardType: TextInputType.text,
                autofocus: true,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomizedTextFormField(
                controller: phController,
                validator: phoneValidated,
                labelText: 'Phone',
                helperText: '11 digits',
                prefixIcon: const Icon(Icons.call),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomizedTextFormField(
                controller: emailController,
                validator: emailValidated,
                labelText: 'Email',
                helperText: 'example@example.com',
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomizedTextFormField(
                maxLines: 5,
                controller: storyController,
                labelText: 'Life Story',
                helperText: 'keep it short, it just a demo',
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomizedTextFormField(
                controller: salaryController,
                labelText: 'Salary',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 50,
              ),
              // ----- password---
              CustomizedTextFormField(
                controller: passController,
                validator: passwordValidated,
                labelText: 'Password',
                obscureText: !visibility,
                maxLines: 1,
                keyboardType: TextInputType.text,
                suffixIcon: InkWell(
                  onTap: () => setState(() {
                    visibility = !visibility;
                  }),
                  child: visibility
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                prefixIcon: const Icon(Icons.lock_outline_rounded),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomizedTextFormField(
                controller: rePassController,
                validator: (value) => value!.compareTo(passController.text) != 0
                    ? 'Confirm Password Not Match'
                    : null,
                labelText: 'Confirm',
                obscureText: !visibility,
                maxLines: 1,
                keyboardType: TextInputType.text,
                suffixIcon: InkWell(
                  onTap: () => setState(() {
                    visibility = !visibility;
                  }),
                  child: visibility
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                prefixIcon: const Icon(Icons.lock_outline_rounded),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                        // check if every filed has evilated its conditions
                        if (_globalFormKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          _user = User(
                            name: nameController.text.trim(),
                            phone: phController.text,
                            email: emailController.text.trim(),
                            salary: num.parse(salaryController.text.trim()),
                            password: passController.text,
                            lifeStory: storyController.text.trim(),
                          );
                          await _preferences
                              .setString('user', _user!.toJson())
                              .then((value) {
                            if (value) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CustomNavigationBar(user: _user),
                                ),
                                (route) => false,
                              );
                            } else {
                              // there is a problem in sign up
                              setState(() async {
                                await _preferences.clear();
                              });
                              log('------------- There is problem her --------');
                            }
                          });
                        }
                      },
                child: _isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
