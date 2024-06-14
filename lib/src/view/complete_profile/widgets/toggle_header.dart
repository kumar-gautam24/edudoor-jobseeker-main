import 'package:flutter/material.dart';

class StatusToggleWidget extends StatelessWidget {
  final String text;
  final int selectedLevel;
  final int level;
  final bool done;
  final Function changeSelectedLevel;

  const StatusToggleWidget({super.key, required this.text, required this.selectedLevel, required this.level, required this.done, required this.changeSelectedLevel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeSelectedLevel();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: selectedLevel == level
                ? Theme.of(context).primaryColor
                : done
                    ? Colors.green
                    : Colors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: selectedLevel == level
                      ? Colors.blue
                      : done
                          ? Colors.green
                          : Colors.grey,
                  fontSize: 16,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Icon(
                selectedLevel == level
                    ? Icons.edit_note_outlined
                    : done
                        ? Icons.check_circle_outline
                        : Icons.add_circle,
                color: selectedLevel == level
                    ? Colors.blue
                    : done
                        ? Colors.green
                        : Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
