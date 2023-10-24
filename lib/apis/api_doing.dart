class ApiEndpoint {
  static const String apiUrl = 'http://10.0.2.2:5159/api';

  static const String LOGIN = apiUrl + '/login';
}

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
