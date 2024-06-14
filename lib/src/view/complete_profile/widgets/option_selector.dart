import 'package:flutter/material.dart';

class OptionSelector extends StatefulWidget {
  final String label;
  final List<String> options;
  final String? initialValue;
  final ValueChanged<String?> onOptionSelected;

  const OptionSelector({
    Key? key,
    required this.label,
    required this.options,
    this.initialValue,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  State<OptionSelector> createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Color(0xFF1F1F1F),
              fontSize: 18,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        SizedBox(height: 8,),
        Container(
          width: double.maxFinite,
          height: 40,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF707070)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedOption,
              items: widget.options.map((String option) {
                return DropdownMenuItem(
                  value: option,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      option,
                      style: const TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 15,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedOption = value;
                });
                widget.onOptionSelected(value);
              },
            ),
          ),
        ),
        SizedBox(height: 16,)
      ],
    );
  }
}
