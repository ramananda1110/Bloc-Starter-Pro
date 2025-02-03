class UserModel {
  final int id;
  final String name;
  final String email;
  final String username;

  UserModel({required this.id, required this.name, required this.email, required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'N/A',
      username: json['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
    };
  }
}
