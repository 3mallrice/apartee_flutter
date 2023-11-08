class RaiseRequest {
  final int apartmentId;
  final int packageId;
  final String requestDescription;
  final String rqBookDateTime;
  final String rqEndDate;
  final bool rqIsSequence;
  final int requestSequence;

  RaiseRequest({
    required this.apartmentId,
    required this.packageId,
    required this.requestDescription,
    required this.rqBookDateTime,
    required this.rqEndDate,
    required this.rqIsSequence,
    required this.requestSequence,
  });

  Map<String, dynamic> toJson() {
    return {
      "apartmentId": apartmentId,
      "packageId": packageId,
      "requestDescription": requestDescription,
      "rqBookDateTime": rqBookDateTime,
      "rqEndDate": rqEndDate,
      "rqIsSequence": rqIsSequence,
      "requestSequence": requestSequence,
    };
  }
}
