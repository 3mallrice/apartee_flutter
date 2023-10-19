class Contract {
  final int contractID;
  final int apartmentID;
  final int contractDetailID;
  final DateTime fromDate;
  final DateTime toDate;
  final String contractImage;
  final String contractStatus;

  Contract({
    required this.contractID,
    required this.apartmentID,
    required this.contractDetailID,
    required this.fromDate,
    required this.toDate,
    required this.contractImage,
    required this.contractStatus,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      contractID: json['ContractID'],
      apartmentID: json['ApartmentID'],
      contractDetailID: json['ContractDetailID'],
      fromDate: DateTime.parse(json['FromDate']),
      toDate: DateTime.parse(json['ToDate']),
      contractImage: json['ContractImage'],
      contractStatus: json['ContractStatus'],
    );
  }
}
