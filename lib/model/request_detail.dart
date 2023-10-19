class RequestDetail {
  final int requestDetailID;
  final int requestID;
  final int packageID;
  final int amount;
  final double price;

  RequestDetail({
    required this.requestDetailID,
    required this.requestID,
    required this.packageID,
    required this.amount,
    required this.price,
  });

  factory RequestDetail.fromJson(Map<String, dynamic> json) {
    return RequestDetail(
      requestDetailID: json['RequestDetailID'],
      requestID: json['RequestID'],
      packageID: json['PackageID'],
      amount: json['Amount'],
      price: json['Price'].toDouble(),
    );
  }
}
