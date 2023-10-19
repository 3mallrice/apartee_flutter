class AddOn {
  final int addOnID;
  final int requestID;
  final int serviceID;
  final int amount;
  final double price;
  final String status;

  AddOn({
    required this.addOnID,
    required this.requestID,
    required this.serviceID,
    required this.amount,
    required this.price,
    required this.status,
  });

  factory AddOn.fromJson(Map<String, dynamic> json) {
    return AddOn(
      addOnID: json['AddOnID'],
      requestID: json['RequestID'],
      serviceID: json['ServiceID'],
      amount: json['Amount'],
      price: json['Price'].toDouble(),
      status: json['Status'],
    );
  }
}
