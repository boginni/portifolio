import 'resume_skill_technology_entity.dart';

class ResumeSkillsEntity {
  final String title;
  final List<ResumeSkillTechnologyEntity> technologies;

  const ResumeSkillsEntity({
    required this.title,
    required this.technologies,
  });

  factory ResumeSkillsEntity.fromJson(dynamic json) {
    return ResumeSkillsEntity(
      title: json['title'] as String,
      technologies:
          (json['technologies'] as List<dynamic>)
              .map(
                (techJson) => ResumeSkillTechnologyEntity.fromJson(
                  techJson as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }
}
