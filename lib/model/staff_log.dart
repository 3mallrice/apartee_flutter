class StaffLog {
  final int staffLogID;
  final int staffID;
  final int requestLogID;

  StaffLog({
    required this.staffLogID,
    required this.staffID,
    required this.requestLogID,
  });

  factory StaffLog.fromJson(Map<String, dynamic> json) {
    return StaffLog(
      staffLogID: json['StaffLogID'],
      staffID: json['StaffID'],
      requestLogID: json['RequestLogID'],
    );
  }
}
