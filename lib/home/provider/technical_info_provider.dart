import 'dart:convert';

import 'package:catalogue/home/model/technical_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TechnicalInfoProvider extends ChangeNotifier{
  List<TechnicalInfo> technicalInfo = [];
  

Future<void> fetchTechnicalInfo()async{
    try {
 
        final String response =
          await rootBundle.loadString("assets/json/technical_info.json");
      final data = jsonDecode(response);
      final List<dynamic> technicalList = data['technicalInfo'];
       technicalInfo = technicalList.map((json) => TechnicalInfo.fromJson(json)).toList();
      // print(technicalInfo);
    } catch (e) {
       // ignore: avoid_print
       print('Error fetching JSON data: $e');
    }
}


}