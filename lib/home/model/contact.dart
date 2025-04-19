class ContactCategory {
  final String title;
  final List<ContactEntry> entries;

  ContactCategory({required this.title, required this.entries});
}

class ContactEntry {
  final String name;
  final String mobile;
  final String email;
  final String division;
  final String designation;
  final String state;

  ContactEntry({
    required this.name,
    required this.mobile,
    required this.email,
    required this.division,
    required this.designation,
    required this.state,
  });

  factory ContactEntry.fromJson(Map<String, dynamic> json) {
    return ContactEntry(
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      division: json['division'],
      designation: json['designation'],
      state: json['state'],
    );
  }
}
