import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/extensions/context_extensions.dart';
import '../components/social_card_widget.dart';
import '../components/social_carousel_widget.dart';
import '../home_store.dart';

class HomeSuccessStatePage extends StatelessWidget {
  const HomeSuccessStatePage(
    this.state, {
    super.key,
    required this.onRefresh,
  });

  final HomeStoreSuccessState state;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  'Welcome back!!!',
                  style: context.textTheme.titleLarge,
                ),
                const Text('Feel Free to explore the app.'),
              ],
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 140 * 3,
            width: double.infinity,
            child: Image.asset(
              fit: BoxFit.cover,
              state.photo,
              alignment: Alignment.topCenter
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.title,
                  style: context.textTheme.titleLarge,
                ),
                Text(state.subtitle),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 16,
              children: [
                SocialCardWidget(
                  title: 'Linkedin',
                  icon: DsAssetsResources.linkedinSvgrepoComSvg,
                ),
                SocialCardWidget(
                  title: 'Currículo',
                  icon: DsAssetsResources.curriculumVitaeSvgrepoComSvg,
                ),
                SocialCardWidget(
                  title: 'Github',
                  icon: DsAssetsResources.github142SvgrepoComSvg,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Semantics(
            explicitChildNodes: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      'Overview',
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                  Column(
                    children:
                        state.description.split('\n\n').map(Text.new).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SocialCarouselWidget(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
