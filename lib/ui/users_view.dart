import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/ui/edit_users.dart';
import '../state/app_state.dart';

class BrowseScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Users'),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userController.errorMessage.value.isNotEmpty) {
          print(userController.errorMessage.value);
          return Center(child: Text(userController.errorMessage.value));
        }

        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return ListTile(
              title: Text(user.name ?? ''),
              subtitle: Text(user.email?? ''),
              onTap: () {
                Get.to(()=>EditScreen( user: user));
              },
            );
          },
        );
      }),
    );
  }
}
