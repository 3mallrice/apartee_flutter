class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponse {
  final int id;
  final String code;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String role;
  final String? avatarLink;
  final DateTime lastLogin;
  final DateTime lastUpdate;
  final String status;

  LoginResponse({
    required this.id,
    required this.code,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    required this.role,
    this.avatarLink,
    required this.lastLogin,
    required this.lastUpdate,
    required this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      role: json['role'],
      avatarLink: json['avatarLink'],
      lastLogin: DateTime.parse(json['lastLogin']),
      lastUpdate: DateTime.parse(json['lastUpdate']),
      status: json['status'],
    );
  }
}
