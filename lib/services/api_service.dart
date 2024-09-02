// services/user_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class UserService {
  static const String baseUrl = 'https://frontend-interview.touchinspiration.net/api/users';

  // Fetch all users
  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => User.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Fetch single user by ID
  static Future<User> fetchUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  // Edit user by ID
  static Future<void> editUser(int id, User user) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }
}
