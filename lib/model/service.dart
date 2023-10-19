class Service {
  final int serviceID;
  final String code;
  final String name;
  final double price;
  final String unit;
  final String serviceStatus;

  Service({
    required this.serviceID,
    required this.code,
    required this.name,
    required this.price,
    required this.unit,
    required this.serviceStatus,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceID: json['ServiceID'],
      code: json['Code'],
      name: json['Name'],
      price: json['Price'].toDouble(),
      unit: json['Unit'],
      serviceStatus: json['ServiceStatus'],
    );
  }
}
