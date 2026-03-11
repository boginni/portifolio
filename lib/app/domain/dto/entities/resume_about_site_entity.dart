import 'resume_about_site_feature_entity.dart';

class ResumeAboutSiteEntity {
  final String title;
  final String description;
  final List<ResumeAboutSiteFeatureEntity> features;

  const ResumeAboutSiteEntity({
    required this.title,
    required this.description,
    required this.features,
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
    );
  }
}
