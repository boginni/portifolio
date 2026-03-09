class ResumeExperienceCompanyEntity {
  final String title;
  final String subtitle;
  final String description;
  final String icon;
  final String startDate;
  final String endDate;

  const ResumeExperienceCompanyEntity({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.startDate,
    required this.endDate,
  });

  factory ResumeExperienceCompanyEntity.fromJson(Map<String, dynamic> json) {
    return ResumeExperienceCompanyEntity(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'icon': icon,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
