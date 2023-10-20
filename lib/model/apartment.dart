class Apartment {
  int apartmentID;
  String apartmentTypeName;
  String buildingCode;
  String ownerCode;
  DateTime fromDate;
  DateTime toDate;
  int sequence;
  String apartmentStatus;

  Apartment({
    required this.apartmentID,
    required this.apartmentTypeName,
    required this.buildingCode,
    required this.ownerCode,
    required this.fromDate,
    required this.toDate,
    required this.sequence,
    required this.apartmentStatus,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      apartmentID: json['ApartmentID'],
      apartmentTypeName: json['ApartmentTypeName'],
      buildingCode: json['BuildingCode'],
      ownerCode: json['OwnerCode'],
      fromDate: DateTime.parse(json['FromDate']),
      toDate: DateTime.parse(json['ToDate']),
      sequence: json['Sequence'],
      apartmentStatus: json['ApartmentStatus'],
    );
  }

  Map<String, dynamic> toJson() => {
        'ApartmentID': apartmentID,
        'ApartmentTypeName': apartmentTypeName,
        'BuildingCode': buildingCode,
        'OwnerCode': ownerCode,
        'FromDate': fromDate.toIso8601String(),
        'ToDate': toDate.toIso8601String(),
        'Sequence': sequence,
        'ApartmentStatus': apartmentStatus,
      };
}
