class ResumeAboutSiteFeatureEntity {
  final String icon;
  final String title;
  final String description;

  const ResumeAboutSiteFeatureEntity({
    required this.icon,
    required this.title,
    required this.description,
  });

  factory ResumeAboutSiteFeatureEntity.fromJson(Map<String, dynamic> json) {
    return ResumeAboutSiteFeatureEntity(
      icon: json['icon'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
