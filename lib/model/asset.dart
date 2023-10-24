class Asset {
  final int assetID;
  final int assetHistoryID;
  final int apartmentID;
  final String name;
  final int quantity;
  final String description;
  final String itemImage;
  final String status;

  Asset({
    required this.assetID,
    required this.assetHistoryID,
    required this.apartmentID,
    required this.name,
    required this.quantity,
    required this.description,
    required this.itemImage,
    required this.status,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      assetID: json['AssetID'],
      assetHistoryID: json['AssetHistoryID'],
      apartmentID: json['ApartmentID'],
      name: json['Name'],
      quantity: json['Quantity'],
      description: json['Description'],
      itemImage: json['ItemImage'],
      status: json['Status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'AssetID': assetID,
        'AssetHistoryID': assetHistoryID,
        'ApartmentID': apartmentID,
        'Name': name,
        'Quantity': quantity,
        'Description': description,
        'ItemImage': itemImage,
        'Status': status,
      };
}
