import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';

class RadioOptionSelector extends StatelessWidget {
  final String title;
  final List<SelectableOption> options;
  final int? initialValue;
  final ValueChanged<int?> onSelectionChanged;

  const RadioOptionSelector({
    super.key,
    required this.title,
    required this.options,
    this.initialValue,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Theme.of(context).primaryColorLight.withOpacity(.8)),
          ),
        ),
        Column(
          children: options
              .map((option) => RadioListTile<int>(
                    title: Text(
                      option.label,
                      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color ?? Theme.of(context).primaryColor),
                    ),
                    value: option.value,
                    subtitle: Text(
                      option.hint,
                      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(.5) ?? Theme.of(context).primaryColor),
                    ),
                    groupValue: initialValue,
                    onChanged: onSelectionChanged,
                    selectedTileColor: Colors.red, // Theme.of(context).primaryColorLight.withOpacity(.3),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class SelectableOption {
  final String label;
  final int value;
  final String hint;

  SelectableOption({required this.label, required this.value, required this.hint});
}
