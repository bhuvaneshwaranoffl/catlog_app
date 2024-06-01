class ManufacturingContact {
  final String name;
  final String designation;
  final String number;
  final String email;
  final String place;

  ManufacturingContact({required this.name, required this.designation, required this.number, required this.email, required this.place});

  factory ManufacturingContact.fromJson(Map<String, dynamic> json) {
    return ManufacturingContact(
      name: json['name'],
      designation: json['designation'],
      number: json['number'],
      email: json['email'],
      place: json['place'],
    );
  }
}
