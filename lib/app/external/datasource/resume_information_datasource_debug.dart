import 'dart:convert';

import '../../domain/dto/entities/resume_about_site_entity.dart';
import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/dto/entities/resume_experience_entity.dart';
import '../../domain/dto/entities/resume_overview_entity.dart';
import '../../domain/dto/entities/resume_skills_entity.dart';
import 'resume_information_datasource.dart';

class ResumeInformationDatasourceDebug implements ResumeInformationDatasource {
  const ResumeInformationDatasourceDebug(this.datasource);

  final ResumeInformationDatasource datasource;

  @override
  Future<ResumeContactEntity> getResumeContact() async {
    return datasource.getResumeContact();
  }

  @override
  Future<ResumeExperienceEntity> getResumeExperiences() async {
    return datasource.getResumeExperiences();
  }

  @override
  Future<ResumeOverviewEntity> getResumeOverview() async {
    return datasource.getResumeOverview();
  }

  @override
  Future<ResumeSkillsEntity> getResumeSkills() async {
    final jsonDecoded = jsonDecode(skillsJson);

    final resumeSkillsEntity = ResumeSkillsEntity.fromJson(jsonDecoded);

    return resumeSkillsEntity;
  }

  @override
  Future<ResumeAboutSiteEntity> getResumeAboutSite() {
    final jsonDecoded = jsonDecode(aboutSiteJson);

    final resumeAboutSiteEntity = ResumeAboutSiteEntity.fromJson(jsonDecoded);

    return Future.value(resumeAboutSiteEntity);
  }
}

const skillsJson = r'''
{
  "title" : "Skills", 
  "technologies" : [
    {
      "name" : "Android",
      "icon" : "android.png",
      "description" : ""
    },
    {
      "name" : "Android Auto",
      "icon" : "androidauto.png",
      "description" : ""
    },
    {
      "name" : "Android Studio",
      "icon" : "androidstudio.png",
      "description" : ""
    },
    {
      "name" : "C++",
      "icon" : "cplusplus.png",
      "description" : ""
    },
    {
      "name" : "Dart",
      "icon" : "dart.png",
      "description" : ""
    },
    {
      "name" : "Docker",
      "icon" : "docker.png",
      "description" : ""
    },
    {
      "name" : "Figma",
      "icon" : "figma.png",
      "description" : ""
    },
    {
      "name" : "Firebase",
      "icon" : "firebase.png",
      "description" : ""
    },
    {
      "name" : "Flutter",
      "icon" : "flutter.png",
      "description" : ""
    },
    {
      "name" : "GitHub",
      "icon" : "github.png",
      "description" : ""
    },
    {
      "name" : "iOS",
      "icon" : "ios.png",
      "description" : ""
    },
    {
      "name" : "JavaScript",
      "icon" : "javascript.png",
      "description" : ""
    },
    {
      "name" : "Laravel",
      "icon" : "laravel.png",
      "description" : ""
    },
    {
      "name" : ".NET (Node.js)",
      "icon" : "nodedotjs.png",
      "description" :""
    },
    {
      "name": "PHP",
      "icon": "php.png",
      "description": ""
    },
    {
        "name": "PostgreSQL",
        "icon": "postgresql.png",
        "description": ""
     },
     {
        "name": "Unity",
        "icon": "unity.png",
        "description": ""
     }
  ]
}
''';
const aboutSiteJson = r'''
{
  "title": "About This Project",
  "description": "This portfolio serves as a live technical demonstration of enterprise-grade Flutter development. Instead of a static build, it operates as a dynamic system with real-world infrastructure.",
  "features": [
    {
      "icon": "0xf0207",
      "title": "Dynamic Data",
      "description": "Experience data fetched via GitHub API."
    },
    {
      "icon": "0xf0372",
      "title": "CI/CD Pipeline",
      "description": "Automated builds via GitHub Actions."
    },
    {
      "icon": "0xf6a8",
      "title": "Responsive Architecture",
      "description": "Reactive layout for 5 breakpoints."
    },
    {
      "icon": "0xf0250",
      "title": "Localization",
      "description": "Full i18n support & translations."
    },
    {
      "icon": "0xf561",
      "title": "Monitoring",
      "description": "Firebase Crashlytics & Event tracking."
    },
    {
      "icon": "0xf016b",
      "title": "Security",
      "description": "Cloudflare edge protection."
    }
  ]
}
''';
