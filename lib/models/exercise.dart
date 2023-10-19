import 'package:mentalhealthapp/models/base_entity.dart';

class Exercise extends BaseEntity {
  final String title;
  final String subtitle;
  final String icon;
  final String color;

  Exercise({
    required String id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  }) : super(id: id);

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map.addAll({
      'title': title,
      'subtitle': subtitle,
      'icon': icon,
      'color': color,
    });
    return map;
  }

  static Exercise fromJson(Map<String, dynamic> json) => Exercise(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        subtitle: json['subtitle'] ?? '',
        icon: json['icon'] ?? '',
        color: json['color'] ?? '',
      );
}
