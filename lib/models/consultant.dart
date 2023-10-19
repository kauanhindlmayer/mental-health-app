import 'package:mentalhealthapp/models/base_entity.dart';

class Consultant extends BaseEntity {
  final String fullName;
  final String categoryName;
  final String color;

  Consultant({
    required String id,
    required this.fullName,
    required this.categoryName,
    required this.color,
  }) : super(id: id);

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map.addAll({
      'fullName': fullName,
      'categoryName': categoryName,
      'color': color,
    });
    return map;
  }

  static Consultant fromJson(Map<String, dynamic> json) => Consultant(
        id: json['id'] ?? '',
        fullName: json['fullName'] ?? '',
        categoryName: json['categoryName'] ?? '',
        color: json['color'] ?? '',
      );
}
