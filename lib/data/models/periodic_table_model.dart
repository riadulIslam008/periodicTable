import 'package:periodic_table/data/models/element_data.dart';

class PeriodicTableModel {
  final List<ElementData> elements;

  PeriodicTableModel({required this.elements});

  factory PeriodicTableModel.fromJson(Map<String, dynamic> json) {
    return PeriodicTableModel(
      elements: json['elements'] != null
          ? List<ElementData>.from(
              json['elements'].map((x) => ElementData.fromJson(x)))
          : [],
    );
  }
}


class ElementImage {
  final String title;
  final String url;
  final String attribution;

  ElementImage({
    required this.title,
    required this.url,
    required this.attribution,
  });

  factory ElementImage.fromJson(Map<String, dynamic> json) {
    return ElementImage(
      title: json['title'],
      url: json['url'],
      attribution: json['attribution'],
    );
  }
}
