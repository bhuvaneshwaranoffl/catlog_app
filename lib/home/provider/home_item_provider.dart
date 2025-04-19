  import 'dart:convert';
  import 'package:flutter/services.dart';
  import 'package:flutter/foundation.dart';
  import '../model/home_page_model.dart';

  class ItemProvider with ChangeNotifier {
    List<Item> _items = [];

    List<Item> get items => _items;

   Future<void> loadItems() async {
    final String response =
        await rootBundle.loadString('assets/json/home_item.json');
    print(response);

    final data = json.decode(response) as List;
    _items = data.map((json) => Item.fromMap(json)).toList(); // 💥 FIXED
    notifyListeners();
  }

  }
