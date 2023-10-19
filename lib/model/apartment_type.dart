class ApartmentType {
  final int apartmentTypeID;
  final int buildingID;
  final String name;
  final String description;
  final String status;

  ApartmentType({
    required this.apartmentTypeID,
    required this.buildingID,
    required this.name,
    required this.description,
    required this.status,
  });

  factory ApartmentType.fromJson(Map<String, dynamic> json) {
    return ApartmentType(
      apartmentTypeID: json['ApartmentTypeID'],
      buildingID: json['BuildingID'],
      name: json['Name'],
      description: json['Description'],
      status: json['Status'],
    );
  }
}
