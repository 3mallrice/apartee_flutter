class Package {
  final int packageID;
  final String apartmentTypeName;
  final String code;
  final String name;
  final String description;
  final String imageUri;
  final double price;

  Package(
      {required this.packageID,
      required this.apartmentTypeName,
      required this.code,
      required this.name,
      required this.description,
      required this.imageUri,
      required this.price});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageID: json['PackageID'],
      apartmentTypeName: json['Name'],
      code: json['Code'],
      name: json['Name'],
      description: json['Description'],
      imageUri: json['ImageUri'],
      price: json['Price'].toDouble(),
    );
  }
}
