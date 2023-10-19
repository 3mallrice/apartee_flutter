class PackageServiceDetail {
  final int packSerDetailID;
  final int serviceID;
  final int packageID;

  PackageServiceDetail({
    required this.packSerDetailID,
    required this.serviceID,
    required this.packageID,
  });

  factory PackageServiceDetail.fromJson(Map<String, dynamic> json) {
    return PackageServiceDetail(
      packSerDetailID: json['PackSerDetailID'],
      serviceID: json['ServiceID'],
      packageID: json['PackageID'],
    );
  }
}
