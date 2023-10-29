class Package {
  int packageId;
  String apartmentTypeName;
  String code;
  String packageName;
  String packageDescription;
  double packagePrice;
  String? packageImageLink;

  Package(
      {required this.packageId,
      required this.apartmentTypeName,
      required this.code,
      required this.packageName,
      required this.packageDescription,
      required this.packagePrice,
      this.packageImageLink});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
        packageId: json['packageId'],
        apartmentTypeName: json['apartmentTypeName'],
        code: json['code'],
        packageName: json['packageName'],
        packageDescription: json['packageDescription'],
        packagePrice: json['packagePrice'].toDouble(),
        packageImageLink: json['packageImageLink']);
  }

  Map<String, dynamic> toJson() {
    return {
      'packageId': packageId,
      'apartmentTypeName': apartmentTypeName,
      'code': code,
      'packageName': packageName,
      'packageDescription': packageDescription,
      'packagePrice': packagePrice,
      'packageImageLink': packageImageLink
    };
  }
}
