class Request {
  int requestId;
  int apartmentId;
  int packageRequestedId;
  int? ownerId;
  String apartmentName;
  String packageName;
  String? owner;
  String? description;
  DateTime bookDateTime;
  DateTime endDateTime;
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
    this.owner,
    this.description,
    required this.bookDateTime,
    required this.endDateTime,
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
      description: json['description'],
      bookDateTime: DateTime.parse(json['bookDateTime']),
      endDateTime: DateTime.parse(json['endDateTime']),
      isSequence: json['isSequence'],
      sequence: json['sequence'],
      reqStatus: json['reqStatus'],
      numberOfAddOns: json['numberOfAddOns'],
    );
  }
}
