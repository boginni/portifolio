import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/dto/entities/resume_experience_company_entity.dart';
import '../../domain/dto/entities/resume_experience_entity.dart';
import '../../domain/dto/entities/resume_overview_entity.dart';
import 'resume_information_datasource.dart';

class ResumeInformationDatasourceDebug implements ResumeInformationDatasource {
  const ResumeInformationDatasourceDebug(this.dio);

  final Dio dio;

  @override
  Future<ResumeContactEntity> getResumeContact() async {
    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/contact.json',
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final jsonData = jsonDecode(data);

      return ResumeContactEntity.fromJson(jsonData);
    }

    throw UnknownFailure(
      'Failed to fetch resume Contact: ${response.statusCode}',
      StackTrace.current,
    );
  }

  @override
  Future<ResumeExperienceEntity> getResumeExperiences() async {
    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/experience.json',
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final jsonData = jsonDecode(json);

      return ResumeExperienceEntity.fromJson(jsonData);
    }

    throw UnknownFailure(
      'Failed to fetch resume overview: ${response.statusCode}',
      StackTrace.current,
    );
  }

  @override
  Future<ResumeOverviewEntity> getResumeOverview() async {
    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/overview.json',
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final jsonData = jsonDecode(data);

      return ResumeOverviewEntity.fromJson(jsonData);
    }

    throw UnknownFailure(
      'Failed to fetch resume overview: ${response.statusCode}',
      StackTrace.current,
    );
  }
}

const json = r'''
{
  "overview" : "Specializing in building scalable, high-performance cross-platform applications. I bridge the gap between complex app architecture and pixel-perfect UI, with a deep focus on SOLID principles and automated testing to ensure long-term maintainability.",
  "kpis": [
    {
      "value": "7+",
      "name": "Years Exp."
    },
    {
      "value": "3M+",
      "name": "Users Impacted"
    },
    {
      "value": "97%",
      "name": "Error-free"
    },
    {
      "value": "50+",
      "name": "Projects"
    }
  ],
  "experiences": [
    {
      "title": "Senior Software Engineer",
      "subtitle": "Cognizant",
      "description": "• Collaborated with MGM Rewards focusing on complex UI and app architecture.\n• Implemented Clean Architecture and SOLID principles.\n• Developed and maintained a robust design system with accessibility standards.\n• Utilized CI/CD and conducted unit, golden, and integration tests.",
      "icon": "logo_cognizant.jpg",
      "startDate": "May 2025",
      "endDate": "Present",
      "location": "Remote"
    },
    {
      "title": "Flutter Developer - Pleno",
      "subtitle": "Farmácias APP | Delivery | By GrupoSC",
      "description": "• Developed the mobile version of the Farmácias App with robust error handling.\n• Collaborated with industry leaders like Toshi Ossada.\n• Contributed to 2M+ users and a 97% error-free rate.",
      "icon": "logo_farmaciasapp.jpg",
      "startDate": "Mar 2024",
      "endDate": "Present",
      "location": "Vila Olímpia, São Paulo - Brazil"
    },
    {
      "title": "Flutter Developer",
      "subtitle": "B M FRANCA TECNOLOGIA",
      "description": "• Developed high-quality Flutter applications as an independent contractor.\n• Collaborated with clients to deliver tailored solutions.\n• Ensured optimal performance through rigorous testing and debugging.",
      "icon": "pj.png",
      "startDate": "Sep 2022",
      "endDate": "Present",
      "location": "Vila Velha, Espirito Santo, Brasil"
    },
    {
      "title": "Cofundador da Comunidade",
      "subtitle": "Flutter Brasil",
      "description": "• Creation of one of the largest Flutter communities in Brazil.\n• Organization of meetups and events to promote Flutter.\n• Production of educational content and moderation of discussion groups.",
      "icon": "logo_flutterbrasil.jpg",
      "startDate": "Jan 2024",
      "endDate": "Present",
      "location": "Brazil"
    },
    {
      "title": "Senior Software Engineer",
      "subtitle": "MGM Resorts International",
      "description": "Senior Software Engineer role focusing on hospitality and gaming enterprise solutions.",
      "icon": "logo_mgm_resorts_international.jpg",
      "startDate": "Jun 2025",
      "endDate": "Dec 2025",
      "location": ""
    },
    {
      "title": "Flutter Developer",
      "subtitle": "Althero",
      "description": "Flutter development for international projects based in France.",
      "icon": "logo_althero.jpg",
      "startDate": "Jun 2024",
      "endDate": "Oct 2025",
      "location": "Rouen, Normandie"
    },
    {
      "title": "Full-stack Developer",
      "subtitle": "RécUp",
      "description": "Full-stack development responsibilities within the Normandie tech ecosystem.",
      "icon": "logo_recup.jpg",
      "startDate": "Sep 2023",
      "endDate": "Oct 2025",
      "location": "Rouen, Normandie"
    },
    {
      "title": "Flutter Developer",
      "subtitle": "PupzDoBrasil®",
      "description": "• Led migration from Flutter 1 to Flutter 3 (40k+ lines refactored).\n• Implemented Null Safety and Flutter Modular for Micro-Frontends.\n• Employed MobX and Triple for state management.",
      "icon": "logo_pupz.jpg",
      "startDate": "Nov 2023",
      "endDate": "Mar 2024",
      "location": ""
    },
    {
      "title": "Flutter Developer",
      "subtitle": "Dentista Organizado",
      "description": "• Refactored source code removing GetX and implementing Flutter Modular.\n• Leveraged ValueNotifier and ChangeNotifier.\n• Conducted UI/UX refactoring to Material Design 3.",
      "icon": "logo_dentista.jpg",
      "startDate": "Aug 2023",
      "endDate": "Nov 2023",
      "location": ""
    },

    {
      "title": "Flutter Developer",
      "subtitle": "COM TECNOLOGIA LTDA",
      "description": "• Led development of a Sales Force application.\n• Designed intuitive UI/UX and implemented SetState.\n• Executed Offline-First approach with SQLite (50+ tables).",
      "icon": "logo_yukem.jpg",
      "startDate": "Sep 2021",
      "endDate": "Dec 2022",
      "location": "Castanhal, Pará, Brazil"
    },
    {
      "title": "IT Assistant",
      "subtitle": "Sea Telecom",
      "description": "• Maintained database and managed customer data.\n• Developed Java scripts for automation.\n• Utilized JavaScript for ERP data entry.",
      "icon": "logo_sea.jpg",
      "startDate": "Feb 2021",
      "endDate": "Jul 2021",
      "location": "Castanhal, Pará, Brazil"
    },
    {
      "title": "PHP Web Developer",
      "subtitle": "Exímio Solutions Jr",
      "description": "• Developed websites using PHP, MySQL, and Apache.\n• Led a team of interns and provided mentorship.",
      "icon": "logo_exmio.jpg",
      "startDate": "Oct 2019",
      "endDate": "May 2020",
      "location": "Castanhal, Pará, Brazil"
    }
  ]
}
''';
