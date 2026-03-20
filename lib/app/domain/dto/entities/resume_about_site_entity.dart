import 'resume_about_site_feature_entity.dart';

class ResumeAboutSiteEntity {
  final String title;
  final String description;
  final String author;
  final String disclaimer;
  final String location;
  final String repositoryUrl;

  final List<ResumeAboutSiteFeatureEntity> features;

  const ResumeAboutSiteEntity({
    required this.title,
    required this.description,
    required this.features,
    required this.author,
    required this.disclaimer,
    required this.location,
    required this.repositoryUrl,
  });

  factory ResumeAboutSiteEntity.fromJson(Map<String, dynamic> json) {
    final featuresJson = json['features'] as List<dynamic>? ?? [];
    final features =
        featuresJson
            .map(
              (featureJson) => ResumeAboutSiteFeatureEntity.fromJson(
                featureJson as Map<String, dynamic>,
              ),
            )
            .toList();

    return ResumeAboutSiteEntity(
      title: json['title'] as String,
      description: json['description'] as String,
      features: features,
      author: json['author'] as String,
      disclaimer: json['disclaimer'] as String,
      location: json['location'] as String,
      repositoryUrl: json['repo_url'] as String,
    );
  }
}
