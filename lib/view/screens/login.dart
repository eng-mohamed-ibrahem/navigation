import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/view/screens/navigation_bar.dart';
import 'package:navigation/view/screens/forget_password.dart';
import 'package:navigation/view/screens/signup.dart';
import '../../controller/providers/user_state_provider.dart';
import '../../model/objects/user.dart';
import '../../model/utility/utility_methods.dart';
import '../components/customized_edit_form_text.dart';

class Login extends HookConsumerWidget {
  Login({super.key});

  final AutoDisposeStateProvider visibilityProvider =
      StateProvider.autoDispose<bool>((ref) => false);

  late User? _user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passController = useTextEditingController();
    final globalFormKey = useMemoized(() => GlobalKey<FormState>());

    _user = ref.watch(userStateProvider);

    final visibilty = ref.read(visibilityProvider);

    return Scaffold(
      body: Form(
        key: globalFormKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/flutter_image.jpg',
                  // height: 120,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomizedTextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  validator: emailValidated,
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
                    onTap: () => ref
                        .watch(visibilityProvider.notifier)
                        .update((state) => !visibilty),
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
                          builder: (context) => ForgetPassword(),
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
                    if (globalFormKey.currentState!.validate()) {
                      if (_user != null) {
                        if (_user!.email == (emailController.text.trim()) &&
                            _user!.password == passController.text) {
                          // navigate to CustomNavigationBar
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomNavigationBar(),
                            ),
                            (route) => false,
                          );
                        }
                      } else {
                        // show snakbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'wrong email or password',
                              style: TextStyle(color: Colors.white),
                            ),
                            action:
                                SnackBarAction(label: 'Ok', onPressed: () {}),
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      }
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
                          builder: (context) => SignUp(),
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
                            fontSize: 20,
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
