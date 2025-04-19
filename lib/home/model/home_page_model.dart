// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  final String image;
  final String name;
  final String route;

  Item(this.image, this.name, this.route);


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
      'route': route,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['image'] as String,
      map['name'] as String,
      map['route'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
