class ContractDetail {
  final int contractDetailID;
  final String code;
  final DateTime startDate;
  final DateTime endDate;

  ContractDetail({
    required this.contractDetailID,
    required this.code,
    required this.startDate,
    required this.endDate,
  });

  factory ContractDetail.fromJson(Map<String, dynamic> json) {
    return ContractDetail(
      contractDetailID: json['ContractDetailID'],
      code: json['Code'],
      startDate: DateTime.parse(json['StartDate']),
      endDate: DateTime.parse(json['EndDate']),
    );
  }
}
