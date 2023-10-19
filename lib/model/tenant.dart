class Tennant {
  final int tennantID;
  final int contractDetailID;
  final String code;
  final String name;
  final String email;
  final String password;
  final String status;
  final String phone;
  final String address;

  Tennant({
    required this.tennantID,
    required this.contractDetailID,
    required this.code,
    required this.name,
    required this.email,
    required this.password,
    required this.status,
    required this.phone,
    required this.address,
  });

  factory Tennant.fromJson(Map<String, dynamic> json) {
    return Tennant(
      tennantID: json['TennantID'],
      contractDetailID: json['ContractDetailID'],
      code: json['Code'],
      name: json['Name'],
      email: json['Email'],
      password: json['Password'],
      status: json['Status'],
      phone: json['Phone'],
      address: json['Address'],
    );
  }
}
