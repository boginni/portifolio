import 'package:ds_assets/ds_assets.dart';

import 'home_store.dart';

class HomeController {
  final HomeStore store;

  const HomeController({
    required this.store,
  });

  Future<void> loadResume() async {
    store.state = HomeStoreState.loading();

    await Future.delayed(const Duration(seconds: 1));

    final result = '''
I have been a Flutter specialist for 4 years and have over 7 years of experience in the field. I have participated in the development of apps for multi-million users during my time at MGM Resorts and Farmácias App. Furthermore, I share my experience in communities, especially Flutter Brasil, with the most influential people in technology from the country.


My expertise in Flutter and Dart is deep and covers the entire development lifecycle, from architecture, state management, components, design system, performance and much more. In addition, I have a solid foundation in front-end and back-end technologies, which allows me to lead projects successfully throughout the entire lifecycle, from concept to implementation.
    ''';

    final state = HomeStoreState.success(
      title: 'My name is Brunno França',
      subtitle: '7+ years of experience',
      description: result,
      linkedinUrl: 'https://www.linkedin.com/in/luiz-fernando-oliveira/',
      githubUrl: '',
      cvUrl: 'https://drive.google',
      photo: DsAssetsPhotos.professionalPortraitSweaterApproachablePng,
    );

    store.state = state;
  }
}
