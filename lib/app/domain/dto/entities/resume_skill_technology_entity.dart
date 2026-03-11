class ResumeSkillTechnologyEntity {
  final String name;
  final String icon;
  final String description;

  const ResumeSkillTechnologyEntity({
    required this.name,
    required this.icon,
    required this.description,
  });

  factory ResumeSkillTechnologyEntity.fromJson(Map<String, dynamic> json) {
    return ResumeSkillTechnologyEntity(
      name: json['name'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
    );
  }
}
