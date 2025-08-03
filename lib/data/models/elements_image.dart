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
