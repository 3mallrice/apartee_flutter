class Request {
  int requestId;
  int apartmentId;
  int packageRequestedId;
  int? ownerId;
  String apartmentName;
  String packageName;
  String? owner;
  dynamic packagePrice;
  String? description;
  DateTime bookDateTime;
  String? apartmentAddress;
  dynamic endDateTime;
  bool? isSequence;
  int? sequence;
  String reqStatus;
  int? numberOfAddOns;

  Request({
    required this.requestId,
    required this.apartmentId,
    required this.packageRequestedId,
    this.ownerId,
    required this.apartmentName,
    required this.packageName,
    this.apartmentAddress,
    this.owner,
    this.packagePrice,
    this.description,
    required this.bookDateTime,
    this.endDateTime,
    this.isSequence,
    this.sequence,
    required this.reqStatus,
    this.numberOfAddOns,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      requestId: json['requestId'],
      apartmentId: json['apartmentId'],
      packageRequestedId: json['packageRequestedId'],
      ownerId: json['ownerId'],
      apartmentName: json['apartmentName'],
      packageName: json['packageName'],
      owner: json['owner'],
      apartmentAddress: json['apartmentAddress'],
      packagePrice: json['packagePrice'],
      description: json['description'],
      bookDateTime: DateTime.parse(json['bookDateTime']),
      endDateTime: json['endDateTime'],
      isSequence: json['isSequence'],
      sequence: json['sequence'],
      reqStatus: json['reqStatus'],
      numberOfAddOns: json['numberOfAddOns'],
    );
  }
}
