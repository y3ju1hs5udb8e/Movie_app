class Video {
  final String name;
  final String key;
  final String site;
  final String size;
  final String type;
  final String id;

  Video({
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'].toString(),
      type: json['type'],
      id: json['id'],
    );
  }
}
