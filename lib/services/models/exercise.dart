class Exercise {
  String id;
  final String title;
  final String subtitle;
  final String icon;
  final String color;

  Exercise({
    this.id = '',
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'icon': icon,
        'color': color,
      };

  static Exercise fromJson(Map<String, dynamic> json) => Exercise(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        subtitle: json['subtitle'] ?? '',
        icon: json['icon'] ?? '',
        color: json['color'] ?? '',
      );
}
