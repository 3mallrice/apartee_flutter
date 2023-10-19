class Request {
  final int requestID;
  final int apartmentID;
  final String description;
  final DateTime bookDateTime;
  final DateTime endDate;
  final bool isSequence;
  final int sequence;
  final String reqStatus;

  Request({
    required this.requestID,
    required this.apartmentID,
    required this.description,
    required this.bookDateTime,
    required this.endDate,
    required this.isSequence,
    required this.sequence,
    required this.reqStatus,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      requestID: json['RequestID'],
      apartmentID: json['ApartmentID'],
      description: json['Description'],
      bookDateTime: DateTime.parse(json['BookDateTime']),
      endDate: DateTime.parse(json['EndDate']),
      isSequence: json['IsSequence'],
      sequence: json['Sequence'],
      reqStatus: json['ReqStatus'],
    );
  }
}
