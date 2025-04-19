import 'dart:convert';
import 'package:catalogue/home/model/contact.dart'; 
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';


class ContactProvider with ChangeNotifier {
  List<ContactCategory> _categories = [];

  List<ContactCategory> get categories => _categories;

  Future<void> loadContacts() async {
    final String response =
        await rootBundle.loadString('assets/json/contact.json');
       // print("response: $response");
    final data = json.decode(response);
    _categories = parseContactJson(data);
    notifyListeners();
  }

  ContactCategory? getCategoryByTitle(String title) {
    return _categories.firstWhere((cat) => cat.title == title,
        orElse: () => ContactCategory(title: title, entries: []));
  }
}




List<ContactCategory> parseContactJson(Map<String, dynamic> json) {
  final contactMap = json['contact'] as Map<String, dynamic>;

  return contactMap.entries.map((entry) {
    final title = entry.key;
    final contactList = (entry.value as List<dynamic>)
        .map((e) => ContactEntry.fromJson(e))
        .toList();

    return ContactCategory(title: title, entries: contactList);
  }).toList();
}

