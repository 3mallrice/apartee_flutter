class Apartment {
  final int apartmentID;
  final int apartmentTypeID;
  final int buildingID;
  final int ownerID;
  final DateTime fromDate;
  final DateTime toDate;
  final int sequence;
  final String apartmentStatus;

  Apartment({
    required this.apartmentID,
    required this.apartmentTypeID,
    required this.buildingID,
    required this.ownerID,
    required this.fromDate,
    required this.toDate,
    required this.sequence,
    required this.apartmentStatus,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      apartmentID: json['ApartmentID'],
      apartmentTypeID: json['ApartmentTypeID'],
      buildingID: json['BuildingID'],
      ownerID: json['OwnerID'],
      fromDate: DateTime.parse(json['FromDate']),
      toDate: DateTime.parse(json['ToDate']),
      sequence: json['Sequence'],
      apartmentStatus: json['ApartmentStatus'],
    );
  }
}
