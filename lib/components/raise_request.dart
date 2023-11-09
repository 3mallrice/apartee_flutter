class RaiseRequest {
  final int apartmentId;
  final int packageId;
  final String requestDescription;

  RaiseRequest({
    required this.apartmentId,
    required this.packageId,
    required this.requestDescription,
  });

  Map<String, dynamic> toJson() {
    return {
      "apartmentId": apartmentId,
      "packageId": packageId,
      "requestDescription": requestDescription,
    };
  }
}
