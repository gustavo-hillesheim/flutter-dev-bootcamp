import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/gender_button.dart';

enum Gender {
  Male, Female
}

class GenderSelector extends StatelessWidget {
  final ValueChanged<Gender> onSelect;
  final Gender selected;

  const GenderSelector({@required this.onSelect, this.selected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GenderButton.male(
              onPressed: () => onSelect(Gender.Male),
              isSelected: selected == Gender.Male,
            )),
        Expanded(
            child: GenderButton.female(
              onPressed: () => onSelect(Gender.Female),
              isSelected: selected == Gender.Female,
            )),
      ],
    );
  }
}