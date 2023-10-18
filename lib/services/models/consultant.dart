class Consultant {
  String id;
  final String fullName;
  final String categoryName;
  final String color;

  Consultant({
    this.id = '',
    required this.fullName,
    required this.categoryName,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'categoryName': categoryName,
        'color': color,
      };

  static Consultant fromJson(Map<String, dynamic> json) => Consultant(
        id: json['id'] ?? '',
        fullName: json['fullName'] ?? '',
        categoryName: json['categoryName'] ?? '',
        color: json['color'] ?? '',
      );
}
