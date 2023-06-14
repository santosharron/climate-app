import 'package:climate/ui/widgets/settings/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndFeedbackDialog extends StatelessWidget {
  const HelpAndFeedbackDialog({super.key});

  @override
  Widget build(BuildContext context) => SimpleDialog(
        title: Text(
          'Help & Feedback',
          style: TextStyle(
            color: Theme.of(context).textTheme.titleMedium!.color,
          ),
        ),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingsTile(
                title: 'Submit request',
                leading: const Icon(FontAwesomeIcons.github),
                onTap: () => launchUrl(
                  Uri.parse('https://github.com/santosharron/climate-app/issues/new'),
                ),
              ),
              SettingsTile(
                title: 'Contact developer',
                leading: FaIcon(
                  Icons.email_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
                onTap: () => launchUrl(
                  Uri.parse('mailto:santoshvpofficial@gmail.com'),
                ),
              ),
            ],
          ),
        ],
      );
}
