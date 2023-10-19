abstract class BaseEntity {
  String id;

  BaseEntity({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
