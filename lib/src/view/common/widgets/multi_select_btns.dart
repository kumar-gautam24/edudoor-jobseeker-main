import 'package:flutter/material.dart';

class MultiSelectBtns extends StatelessWidget {
  final List<dynamic> list;
  final Function onChange;
  final List<String> selectedValue;

  const MultiSelectBtns({
    super.key,
    required this.list,
    required this.onChange,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (String option in list)
            CheckboxListTile(
              selectedTileColor: Theme.of(context).primaryColor.withOpacity(.1),
              enableFeedback: true,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                option,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              value: selectedValue.contains(option),
              onChanged: (value) {
                onChange(option);
              },
            )
        ],
      ),
    );
  }
}
