class AssetHistory {
  final int assetHistoryID;
  final String code;
  final DateTime date;
  final String description;
  final int quantity;
  final String itemImage;
  final String status;

  AssetHistory({
    required this.assetHistoryID,
    required this.code,
    required this.date,
    required this.description,
    required this.quantity,
    required this.itemImage,
    required this.status,
  });

  factory AssetHistory.fromJson(Map<String, dynamic> json) {
    return AssetHistory(
      assetHistoryID: json['AssetHistoryID'],
      code: json['Code'],
      date: DateTime.parse(json['Date']),
      description: json['Description'],
      quantity: json['Quantity'],
      itemImage: json['ItemImage'],
      status: json['Status'],
    );
  }
}
