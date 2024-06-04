class Node {
  String name;
  String img;
  String? url;
  List<Node> value;

  Node({
    required this.name,
    required this.img,
    this.url,
    required this.value,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      name: json['name'],
      img: json['img'],
      // ignore: prefer_if_null_operators
      url: json['url'] != null ? json['url'] : null,
      value: json['value'] != null
          ? (json['value'] as List).map((i) => Node.fromJson(i)).toList()
          : [],
    );
  }
}
