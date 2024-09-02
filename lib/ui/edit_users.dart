import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/user_model.dart';
import '../state/app_state.dart';

class EditScreen extends StatelessWidget {
  final User user;
  final UserController userController = Get.find();

  EditScreen({super.key, required this.user});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with user data
    nameController.text = user.name;
    emailController.text = user.email;
    occupationController.text = user.occupation;
    bioController.text = user.bio;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: occupationController,
              decoration: const InputDecoration(labelText: 'Occupation'),
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Create an updated User object
                final updatedUser = User(
                  id: user.id,
                  name: nameController.text,
                  email: emailController.text,
                  occupation: occupationController.text,
                  bio: bioController.text,
                );

                // Call updateUser with correct parameters
                userController.updateUser(user.id, updatedUser);


                // Navigate back after updating
                Get.back();
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
