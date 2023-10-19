class Package {
  final int packageID;
  final int apartmentTypeID;
  final String code;
  final String name;
  final String description;
  final double price;

  Package({
    required this.packageID,
    required this.apartmentTypeID,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageID: json['PackageID'],
      apartmentTypeID: json['ApartmentTypeID'],
      code: json['Code'],
      name: json['Name'],
      description: json['Description'],
      price: json['Price'].toDouble(),
    );
  }
}
