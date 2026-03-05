import 'package:ds_assets/ds_assets.dart';

import '../../domain/dto/entities/resume_experience_entity.dart';
import 'experience_store.dart';

final List<ResumeExperienceEntity> experienceList = [
  const ResumeExperienceEntity(
    title: 'Senior Software Engineer',
    subtitle: 'Cognizant',
    description: '''
• Collaborated with MGM Rewards as a Senior Software Engineer, focusing on complex UI and app architecture.
• Implemented Clean Architecture and SOLID principles to enhance code quality and maintainability.
• Developed and maintained a robust design system while ensuring accessibility standards were met.
• Utilized CI/CD practices and conducted unit, golden, and integration tests to ensure software reliability.
''',
    icon: '',
    startDate: 'May 2025',
    endDate: 'Present',
  ),
  const ResumeExperienceEntity(
    title: 'Flutter Developer',
    subtitle: 'B M FRANCA TECNOLOGIA',
    description: '''
• Developed high-quality Flutter applications as an independent contractor, focusing on scalable codebases.
• Collaborated with clients to understand their app requirements and deliver tailored solutions.
• Ensured optimal performance and user experience through rigorous testing and debugging.
''',
    icon: '',
    startDate: 'Sep 2022',
    endDate: 'Present',
  ),
  const ResumeExperienceEntity(
    title: 'Flutter Developer - Sr',
    subtitle: 'Farmácias APP | Delivery | By GrupoSC',
    description: '''
• Developed the mobile version of the Farmácias App, ensuring high code quality and robust error handling.
• Collaborated with a diverse team, including industry leaders like Toshi Ossada, to enhance product functionality.
• Contributed to achieving over 2 million users and a 97% error-free rate, showcasing commitment to excellence.
''',
    icon: '',
    startDate: 'Mar 2024',
    endDate: 'May 2025',
  ),
  const ResumeExperienceEntity(
    title: 'Flutter Developer',
    subtitle: 'PupzDoBrasil®',
    description: '''
• Led the migration of Pupz's core application from Flutter 1 to Flutter 3, refactoring over 40,000 lines of code.
• Implemented Null Safety and utilized Flutter Modular for a micro Frontends architecture.
• Employed MobX and Triple for effective state management, adhering to SOLID, MVC, and Clean Architecture principles.
• Developed multi-platform applications for both Android and iOS, enhancing user experience and functionality.
''',
    icon: '',
    startDate: 'Nov 2023',
    endDate: 'Mar 2024',
  ),
  const ResumeExperienceEntity(
    title: 'Flutter Developer',
    subtitle: 'Dentista Organizado',
    description: '''
• Enhanced the Dentista Organizado application through modular design and efficient state management.
• Refactored source code by removing GetX and implementing Flutter Modular for improved route management.
• Leveraged native Flutter state management techniques, including ValueNotifier and ChangeNotifier.
• Conducted comprehensive UI/UX refactoring in line with Material Design 3 standards.
''',
    icon: '',
    startDate: 'Aug 2023',
    endDate: 'Nov 2023',
  ),
  const ResumeExperienceEntity(
    title: 'Flutter Developer',
    subtitle: 'COM TECNOLOGIA LTDA',
    description: '''
• Led the development of a Sales Force application using Flutter, overseeing the project from conception to implementation.
• Designed intuitive UI/UX and implemented state management using SetState to enhance user experience.
• Executed an Offline-First approach with SQLite, managing over 50 tables for robust offline functionality.
''',
    icon: '',
    startDate: 'Sep 2021',
    endDate: 'Dec 2022',
  ),
  const ResumeExperienceEntity(
    title: 'IT Assostent',
    subtitle: 'Sea Telecom',
    description: '''
• Maintained the database and managed customer data for SEA Telecom, enhancing operational efficiency.
• Developed scripts and utilities in Java to automate repetitive data management tasks.
• Utilized JavaScript for data entry and collection from ERP forms, improving productivity.
• Demonstrated a strong commitment to transitioning into a software development role.
''',
    icon: '',
    startDate: 'Feb 2021',
    endDate: 'Jul 2021',
  ),
  const ResumeExperienceEntity(
    title: 'PHP Web Developer',
    subtitle: 'Exímio Solutions Jr',
    description: '''
• Developed two websites utilizing PHP, HTML, CSS, JavaScript, MySQL, and Apache, enhancing my technical skills.
• Led a team of interns, providing mentorship and fostering a collaborative learning environment.
• Contributed to the growth of Exímio Solutions Jr by applying self-taught programming skills in a professional setting.
''',
    icon: '',
    startDate: 'Oct 2019',
    endDate: 'May 2020',
  ),
];

class ExperienceController {
  final ExperienceStore store;

  const ExperienceController({
    required this.store,
  });

  Future<void> loadResume() async {
    store.state = ExperienceStoreState.loading();

    await Future.delayed(const Duration(seconds: 1));

    final state = ExperienceStoreState.success(
      experienceCompanyList: experienceList,
    );

    store.state = state;
  }
}
