class TechnicalInfo {
  final String name;
  final String img;
  final List<SubmittalCategory>? value;

  TechnicalInfo({
    required this.name,
    required this.img,
    required this.value,
  });

  factory TechnicalInfo.fromJson(Map<String, dynamic> json) {
    return TechnicalInfo(
      name: json['name'],
      img: json['img'],
      value: json['value'] != null
          ? (json['value'] as List)
              .map((item) => SubmittalCategory.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'img': img,
      'value': value?.map((item) => item.toJson()).toList(),
    };
  }
}

class SubmittalCategory {
  final String name;
  final String img;
  final List<SubmittalItem>? value;

  SubmittalCategory({
    required this.name,
    required this.img,
    required this.value,
  });

  factory SubmittalCategory.fromJson(Map<String, dynamic> json) {
    return SubmittalCategory(
      name: json['name'],
      img: json['img'],
      value: json['value'] != null
          ? (json['value'] as List)
              .map((item) => SubmittalItem.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'img': img,
      'value': value?.map((item) => item.toJson()).toList(),
    };
  }
}

class SubmittalItem {
  final String name;
  final String img;
  final List<SubmittalData>? value;

  SubmittalItem({
    required this.name,
    required this.img,
    this.value,
  });

  factory SubmittalItem.fromJson(Map<String, dynamic> json) {
    return SubmittalItem(
      name: json['name'],
      img: json['img'],
      value: json['value'] != null
          ? (json['value'] as List)
              .map((item) => SubmittalData.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'img': img,
      'value': value?.map((item) => item.toJson()).toList(),
    };
  }
}

class SubmittalData {
  final String urlPdf;

  SubmittalData({required this.urlPdf});

  factory SubmittalData.fromJson(Map<String, dynamic> json) {
    return SubmittalData(
      urlPdf: json['urlPdf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'urlPdf': urlPdf,
    };
  }
}
