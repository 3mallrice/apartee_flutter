class Owner {
  final int ownerID;
  final String code;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String status;

  Owner({
    required this.ownerID,
    required this.code,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.status,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      ownerID: json['OwnerID'],
      code: json['Code'],
      name: json['Name'],
      email: json['Email'],
      password: json['Password'],
      phone: json['Phone'],
      address: json['Address'],
      status: json['Status'],
    );
  }
}
