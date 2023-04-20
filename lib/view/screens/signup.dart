import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/controller/providers/shared_preference_provider.dart';
import 'package:navigation/model/utility/constants.dart';
import 'package:navigation/view/screens/navigation_bar.dart';
import '../../model/objects/user.dart';
import '../components/customized_edit_form_text.dart';
import '../../model/utility/utility_methods.dart';

class SignUp extends HookConsumerWidget {
  SignUp({super.key});

  final AutoDisposeStateProvider<bool> visibilityProvider =
      StateProvider.autoDispose<bool>(
    (ref) => false,
  );

  final AutoDisposeStateProvider<bool> isLoadingProvider =
      StateProvider.autoDispose<bool>(
    (ref) => false,
  );

  late User? _user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final TextEditingController nameController = useTextEditingController();
    final TextEditingController phController = useTextEditingController();
    final TextEditingController passController = useTextEditingController();
    final TextEditingController rePassController = useTextEditingController();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController storyController = useTextEditingController();
    final TextEditingController salaryController = useTextEditingController();
    final GlobalKey<FormState> globalFormKey =
        useMemoized(() => GlobalKey<FormState>());

    final visibility = ref.watch(visibilityProvider);
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Form(
        key: globalFormKey,
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 11,
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                  onTap: () {
                    ref
                        .watch(visibilityProvider.notifier)
                        .update((state) => !visibility);
                  },
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
                  onTap: () {
                    ref
                        .watch(visibilityProvider.notifier)
                        .update((state) => !visibility);
                  },
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
                onPressed: isLoading
                    ? null
                    : () async {
                        // check if every filed has evilated its conditions
                        if (globalFormKey.currentState!.validate()) {
                          ref
                              .watch(isLoadingProvider.notifier)
                              .update((state) => !isLoading);
                          _user = User(
                            name: nameController.text.trim(),
                            phone: phController.text,
                            email: emailController.text.trim(),
                            salary: num.parse(salaryController.text.trim()),
                            password: passController.text,
                            lifeStory: storyController.text.trim(),
                          );

                          ref.read(sharedPreferenceProvider).whenData(
                            (shared) async {
                              shared
                                  .setString(Constants.key, _user!.toJson())
                                  .then(
                                (value) {
                                  if (value) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CustomNavigationBar(),
                                      ),
                                      (route) => false,
                                    );
                                  } else {
                                    ref.read(sharedPreferenceProvider).whenData(
                                          (shared) =>
                                              shared.remove(Constants.key),
                                        );
                                  }
                                },
                              );
                            },
                          );
                        }
                      },
                child: isLoading
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
