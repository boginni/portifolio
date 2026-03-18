import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/background_split.dart';
import '../../../components/high_resolution_image.dart';
import '../../../components/social_icon_widget.dart';

class HomePageDesktopSuccessState extends StatelessWidget {
  const HomePageDesktopSuccessState({
    super.key,
    required this.data,
    required this.onRefresh,
  });

  final ResumeOverviewEntity data;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Material(
        color: context.colorScheme.surface,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Positioned.fill(
                child: BackgroundSplit(),
              ),
              const Positioned(
                top: 0,
                bottom: 0,
                right: 16,
                child: HighResolutionImage(
                  assetPath: DsAssetsPhotos.professionalSuitDistractedPng,
                  ratio: 3330 / 5000,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 64.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, I am',
                        style: textTheme.headlineSmall?.copyWith(
                          shadows:  [
                            Shadow(
                              color:context.colorScheme.surface,
                              offset: const Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),

                      ),
                      const SizedBox(height: 16),
                      Text(
                        data.name,
                        style: textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                          shadows: [
                            Shadow(
                              color: context.colorScheme.surface,
                              offset: const Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        data.title,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          shadows:  [
                            Shadow(
                              color:context.colorScheme.surface,
                              offset: const Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16 * 2,
                      ),
                      const Row(
                        children: [
                          SocialIconWidget(Icons.alternate_email),
                          SocialIconWidget(Icons.code),
                          SocialIconWidget(Icons.link),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
