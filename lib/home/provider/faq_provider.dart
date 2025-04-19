import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FaqProvider extends ChangeNotifier {
  List getfAQ = [];

  Future<void> readjson() async {
    final String response = await rootBundle.loadString("assets/json/faq.json");
    final data = await jsonDecode(response);
    getfAQ = data["productFAQs"];
    // ignore: avoid_print
    print(data);
    notifyListeners();
  }
}




