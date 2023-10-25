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

class StaffLoginResponse {
  final int staffId;
  final String email;
  final String staffName;
  final String staffPhone;
  final String address;
  final String staffStatus;
  final String avatarLink;
  final String code;
  final String role;

  StaffLoginResponse({
    required this.staffId,
    required this.email,
    required this.staffName,
    required this.staffPhone,
    required this.address,
    required this.staffStatus,
    required this.avatarLink,
    required this.code,
    required this.role,
  });

  factory StaffLoginResponse.fromJson(Map<String, dynamic> json) {
    return StaffLoginResponse(
      staffId: json['staffId'],
      email: json['email'],
      staffName: json['staffName'],
      staffPhone: json['staffPhone'],
      address: json['address'],
      staffStatus: json['staffStatus'],
      avatarLink: json['avatarLink'],
      code: json['code'],
      role: json['role'],
    );
  }
}

class AccountLoginResponse {
  final String code;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String role;
  final String status;

  AccountLoginResponse({
    required this.code,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    required this.status,
  });

  factory AccountLoginResponse.fromJson(Map<String, dynamic> json) {
    return AccountLoginResponse(
      code: json['code'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      role: json['role'],
      status: json['status'],
    );
  }
}
