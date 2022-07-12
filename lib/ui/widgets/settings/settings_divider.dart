import 'package:flutter/material.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) => Divider(
        height: 1,
        color: Theme.of(context).textTheme.subtitle1!.color!.withAlpha(65),
      );
}
