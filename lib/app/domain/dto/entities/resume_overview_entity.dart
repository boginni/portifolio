class ResumeOverviewEntity {
  final String name;
  final String prefix;
  final String title;
  final String photoAsset;
  final String linkedinUrl;
  final String githubUrl;
  final String cvUrl;
  final String professionalSummary;
  final String status;

  const ResumeOverviewEntity({
    required this.name,
    required this.prefix,
    required this.title,
    required this.photoAsset,
    required this.linkedinUrl,
    required this.githubUrl,
    required this.cvUrl,
    required this.professionalSummary,
    required this.status,
  });

  factory ResumeOverviewEntity.fromJson(Map<String, dynamic> json) {
    // Accessing the nested social_links map
    final social = json['social_links'] as Map<String, dynamic>?;

    return ResumeOverviewEntity(
      name: json['name'] ?? '',
      prefix: json['prefix'] ?? '',
      title: json['title'] ?? '',
      photoAsset: json['photo_asset'] ?? '',
      linkedinUrl: social?['linkedin'] ?? '',
      githubUrl: social?['github'] ?? '',
      cvUrl: social?['cv_url'] ?? '',
      professionalSummary: json['professional_summary'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'prefix': prefix,
      'title': title,
      'photo_asset': photoAsset,
      'social_links': {
        'linkedin': linkedinUrl,
        'github': githubUrl,
        'cv_url': cvUrl,
      },
      'professional_summary': professionalSummary,
      'status': status,
    };
  }
}
