import 'package:flutter/material.dart';
import 'package:navigation/routes/signup.dart';
import '../utility_method/utility_methods.dart';


// create statefullWidget because there is widget will changed during an action
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool visibilty = false;

// creating global key which idenfy uniqe form
// apply to form thar provide validation
  final _globalFormKey = GlobalKey<FormState>();

  final eController = TextEditingController();
  final pController = TextEditingController();

  @override
  void initState() {
    super.initState();
    eController.addListener(() => debugPrint(eController.text));
    pController.addListener(() => debugPrint(pController.text));
  }

  @override
  void dispose() {
    eController.dispose();
    pController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalFormKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              TextFormField(
                onChanged: (value) => debugPrint(value),
                controller: eController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'email',
                  helperText: 'example@gmail.com',
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                validator: (value) => emailValidated(value),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: pController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: InkWell(
                    onTap: () => setState(() {
                      visibilty = !visibilty;
                    }),
                    child: visibilty
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                obscureText: !visibilty,
                // apply password validation
                validator: (value) => passwordValidated(value),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_globalFormKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Sensitive Info'),
                          content: Text(
                              'email: ${eController.text}\npass: ${pController.text}'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: const Text('OK'))
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
