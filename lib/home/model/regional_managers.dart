class RegionalManager {
  final String name;
  final String designation;
  final String number;
  final String email;
  final String region;

  RegionalManager({
    required this.name,
    required this.designation,
    required this.number,
    required this.email,
    required this.region,
  });

  factory RegionalManager.fromJson(Map<String, dynamic> json) {
    return RegionalManager(
      name: json['name'],
      designation: json['designation'],
      number: json['number'],
      email: json['email'],
      region: json['region'],
    );
  }
}
