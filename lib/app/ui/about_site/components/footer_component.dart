import 'package:flutter/material.dart';

import '../../../domain/dto/entities/resume_about_site_entity.dart';
import '../../app/extensions/context_extensions.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({
    super.key,
    required this.entity,
    required this.onTapRepository,
  });

  final ResumeAboutSiteEntity entity;
  final VoidCallback onTapRepository;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  entity.author,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                SelectableText(
                  entity.disclaimer,
                  style: context.textTheme.bodyMedium?.copyWith(),
                ),
              ],
            ),
            Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.code_rounded,
                        size: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        SelectableText(
          entity.location,
          style: context.textTheme.labelSmall?.copyWith(
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
