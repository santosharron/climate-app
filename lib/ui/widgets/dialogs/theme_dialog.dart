import 'package:climate/data/models/theme_model.dart';
import 'package:climate/ui/state_notifiers/theme_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeDialog extends ConsumerWidget {
  static const _dialogOptions = {
    'Light': ThemeModel.light,
    'Dark': ThemeModel.dark,
    'System default': ThemeModel.systemDefault,
  };

  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeStateNotifier = ref.watch(themeStateNotifierProvider.notifier);
    final theme =
        ref.watch(themeStateNotifierProvider.select((state) => state.theme));

    final radios = [
      for (final entry in _dialogOptions.entries)
        RadioListTile<ThemeModel>(
          title: Text(
            entry.key,
            style: TextStyle(
              color: Theme.of(context).textTheme.titleMedium!.color,
            ),
          ),
          value: entry.value,
          groupValue: theme,
          onChanged: (newValue) async {
            await themeStateNotifier.setTheme(newValue!);
            Navigator.pop(context);
          },
        )
    ];

    return SimpleDialog(
      title: Text(
        'Theme',
        style: TextStyle(
          color: Theme.of(context).textTheme.titleMedium!.color,
        ),
      ),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: radios,
        ),
      ],
    );
  }
}
