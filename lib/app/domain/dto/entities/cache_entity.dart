class CacheEntity {
  final String id;
  final dynamic value;
  final DateTime date;

  const CacheEntity({
    required this.id,
    required this.value,
    required this.date,
  });

  factory CacheEntity.fromJson(dynamic json) {
    return CacheEntity(
      id: json['id'],
      value: json['value'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
      'date': date.toIso8601String(),
    };
  }
}
