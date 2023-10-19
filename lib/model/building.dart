class Building {
  final int buildingID;
  final String code;
  final String name;
  final String address;
  final String status;

  Building({
    required this.buildingID,
    required this.code,
    required this.name,
    required this.address,
    required this.status,
  });

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      buildingID: json['BuildingID'],
      code: json['Code'],
      name: json['Name'],
      address: json['Address'],
      status: json['Status'],
    );
  }
}
