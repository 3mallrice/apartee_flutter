class Apartment {
  int apartmentId;
  int apartmentTypeId;
  String apartmentName;
  int buildingId;
  int ownerId;
  DateTime fromDate;
  DateTime toDate;
  int? sequence;
  String apartmentStatus;
  int? contractNumber;
  String? apartmentType;
  List<dynamic>? assets;
  String? building;
  List<dynamic>? contracts;
  String? owner;
  List<dynamic>? requests;

  Apartment({
    required this.apartmentId,
    required this.apartmentTypeId,
    required this.apartmentName,
    required this.buildingId,
    required this.ownerId,
    required this.fromDate,
    required this.toDate,
    this.sequence,
    required this.apartmentStatus,
    this.contractNumber,
    this.apartmentType,
    this.assets,
    this.building,
    this.contracts,
    this.owner,
    this.requests,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      apartmentId: json['apartmentId'],
      apartmentTypeId: json['apartmentTypeId'],
      apartmentName: json['apartmentName'],
      buildingId: json['buildingId'],
      ownerId: json['ownerId'],
      fromDate: DateTime.parse(json['fromDate']),
      toDate: DateTime.parse(json['toDate']),
      sequence: json['sequence'],
      apartmentStatus: json['apartmentStatus'],
      contractNumber: json['contractNumber'],
      apartmentType: json['apartmentType'],
      assets: json['assets'],
      building: json['building'],
      contracts: json['contracts'],
      owner: json['owner'],
      requests: json['requests'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apartmentId': apartmentId,
      'apartmentTypeId': apartmentTypeId,
      'apartmentName': apartmentName,
      'buildingId': buildingId,
      'ownerId': ownerId,
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'sequence': sequence,
      'apartmentStatus': apartmentStatus,
      'contractNumber': contractNumber,
      'apartmentType': apartmentType,
      'assets': assets,
      'building': building,
      'contracts': contracts,
      'owner': owner,
      'requests': requests,
    };
  }
}
