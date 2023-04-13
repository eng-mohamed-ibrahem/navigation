import 'package:flutter/material.dart';
import 'package:navigation/controller/shared_preference_controller.dart';
import 'package:navigation/view/screens/navigation_bar.dart';
import 'package:navigation/view/screens/forget_password.dart';
import 'package:navigation/view/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/customized_edit_form_text.dart';

// create statefullWidget because there is widget will changed during an action
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<Login> {
  bool visibilty = false;

// creating global key which idenfy uniqe form
// apply to form thar provide validation
  final _globalFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  late SharedPrefController sharedPrefController;

  @override
  void dispose() {
    emailController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    sharedPrefController =
        SharedPrefController(pref: await SharedPreferences.getInstance());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalFormKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  '../assets/images/flutter_image.jpg',
                  height: 120,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomizedTextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  controller: emailController,
                  labelText: 'Email',
                  helperText: 'example@gmail.com',
                  prefixIcon: const Icon(Icons.email_outlined),
                  autofocus: true,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomizedTextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  controller: passController,
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  obscureText: !visibilty,
                  suffixIcon: InkWell(
                    onTap: () => setState(() {
                      visibilty = !visibilty;
                    }),
                    child: visibilty
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      // navigate to forgetPassword page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(
                        color: Colors.lightBlue.shade600,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (sharedPrefController
                            .checkEmail(emailController.text.trim()) &&
                        sharedPrefController
                            .checkPassword(passController.text)) {
                      // navigate to CustomNavigationBar
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomNavigationBar(),
                        ),
                        (route) => false,
                      );
                    } else {
                      // show snakbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'wrong email or password',
                            style: TextStyle(color: Colors.white),
                          ),
                          action: SnackBarAction(
                              label: 'Ok', onPressed: (){}),
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      // navigate to sign up page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: 'Dont have account? ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Colors.lightBlue.shade600,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
