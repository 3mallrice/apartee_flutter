class UpdateRequest {
  int requestId;
  String? maintainItem;
  String? description;
  int staffId;
  String status;

  UpdateRequest({
    required this.requestId,
    this.maintainItem,
    this.description,
    required this.staffId,
    required this.status,
  });

  factory UpdateRequest.fromJson(Map<String, dynamic> json) {
    return UpdateRequest(
      requestId: json['requestId'] as int,
      maintainItem: json['maintainItem'] as String,
      description: json['description'] as String,
      staffId: json['staffId'] as int,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'requestId': requestId,
      'maintainItem': maintainItem,
      'description': description,
      'staffId': staffId,
      'status': status,
    };
  }
}
