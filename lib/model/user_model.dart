class User {
  final String id;
  final String name;
  final String email;
  final String occupation;
  final String bio;

  User({required this.id, required this.name, required this.email, required this.occupation, required this.bio});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '', // Handle null
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      occupation: json['occupation'] ?? 'Unknown',
      bio: json['bio'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'occupation': occupation,
      'bio': bio,
    };
  }
}
