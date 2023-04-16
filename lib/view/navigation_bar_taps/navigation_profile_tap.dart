import 'package:flutter/material.dart';
import 'package:navigation/view/components/customized_edit_form_text.dart';

import '../../model/objects/user.dart';

// statefull to bring data

class NavProfile extends StatelessWidget {
  final User? user;
  const NavProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      child: CircleAvatar(
                        backgroundColor: Colors.amber.shade700,
                        child:
                            const Icon(Icons.camera_alt, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomizedTextFormField(
            readOnly: true,
            // enabled: false,
            hintText: '${user!.name}',
            label: const Text('My Name'),
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            readOnly: true,
            // enabled: false,
            hintText: '${user!.email}',
            label: const Text('My Email'),
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            // enabled: false,
            readOnly: true,
            hintText: '${user!.phone}',
            label: const Text('My Mobile Number'),
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            // enabled: false,
            readOnly: true,
            hintText: '${user!.salary}',
            label: const Text('My Salary'),
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            readOnly: true,
            // enabled: false,
            hintText: '${user!.lifeStory}',
            label: const Text('My Life Story'),
            maxLines: 5,
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            readOnly: true,
            // enabled: false,
            hintText: '${user!.password}',
            label: const Text('My Password'),
          ),
        ],
      ),
    );
  }
}
