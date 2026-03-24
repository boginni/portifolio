

import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_contact_entity.dart';
import '../../../../app/components/profile_avatar_widget.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/contact_card_widget.dart';

class ContactPageSuccessStateDesktop extends StatefulWidget {
  const ContactPageSuccessStateDesktop({
    super.key,
    required this.entity,
  });

  final ResumeContactEntity entity;

  @override
  State<ContactPageSuccessStateDesktop> createState() =>
      _ContactPageSuccessStateDesktopState();
}

class _ContactPageSuccessStateDesktopState
    extends State<ContactPageSuccessStateDesktop> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16 * 2,
          horizontal: 16 * 2,
        ),
        child: SizedBox(
          height: 16 * 10 * 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SelectableText(
                    context.l10n.get_in_touch,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  const CloseButton(),
                ],
              ),
              const SizedBox(height: 16 * 2),
              Flexible(
                child: Row(
                  spacing: 16 * 3,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: ProfileAvatarWidget(),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ContactCardWidget(
                            icon: Icons.email_outlined,
                            title: 'Email',
                            value: widget.entity.email,
                            onTap: () {},
                          ),
                          ContactCardWidget(
                            icon: Icons.phone_android_outlined,
                            title: 'WhatsApp',
                            value: widget.entity.whatsapp,
                            onTap: () {},
                          ),
                          ContactCardWidget(
                            icon: Icons.location_on_outlined,
                            title: 'Location',
                            value: widget.entity.location,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
