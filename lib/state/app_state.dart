import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user_model.dart'; // Import the User model

class UserController extends GetxController {
  var users = <User>[].obs; // Use User type instead of dynamic
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  StreamSubscription? _subscription; // StreamSubscription for handling stream

  @override
  void onInit() {
    super.onInit();
    fetchUsers(); // Call to fetch data
  }

  @override
  void onClose() {
    _subscription?.cancel(); // Ensure subscription is canceled safely
    super.onClose();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true); // Show loading indicator
      final response = await http.get(Uri.parse('https://frontend-interview.touchinspiration.net/api/users'));
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        users.value = data.map((json) => User.fromJson(json)).toList(); // Map response to User objects
      } else {
        errorMessage('Failed to load users');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false); // Hide loading indicator
    }
  }

  Future<void> updateUser(String id, User updatedUser) async {
    try {
      isLoading(true);
      final uri = Uri.parse('https://frontend-interview.touchinspiration.net/api/users/$id');
      final response = await http.patch(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedUser.toJson()), // Convert User to JSON
      );
      print('Request URL: $uri');
      print('Request Body: ${json.encode(updatedUser.toJson())}');
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        // Update the local user list
        final index = users.indexWhere((user) => user.id == id);
        if (index != -1) {
          users[index] = updatedUser;
        }
      } else {
        errorMessage('Failed to update user');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
