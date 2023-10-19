class Bill {
  final int billID;
  final int requestID;
  final double totalPrice;
  final String status;

  Bill({
    required this.billID,
    required this.requestID,
    required this.totalPrice,
    required this.status,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      billID: json['BillID'],
      requestID: json['RequestID'],
      totalPrice: json['TotalPrice'].toDouble(),
      status: json['Status'],
    );
  }
}
