class KpiEntity {
  final String name;
  final String value;

  const KpiEntity({
    required this.name,
    required this.value,
  });

  factory KpiEntity.fromJson(Map<String, dynamic> json) {
    return KpiEntity(
      name: json['name'] ?? '',
      value: json['value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
    };
  }
}
