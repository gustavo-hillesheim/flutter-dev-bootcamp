import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/app_card.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const selectedCardColor = Color(0xFF1D1E33);
const unselectedCardColor = Color(0xFF111328);

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const GenderButton({
    @required this.icon,
    @required this.text,
    @required this.onPressed,
    this.isSelected = false,
  });

  factory GenderButton.male({@required VoidCallback onPressed, bool isSelected = false}) {
    return GenderButton(
      icon: FontAwesomeIcons.mars,
      text: 'MALE',
      onPressed: onPressed,
      isSelected: isSelected,
    );
  }

  factory GenderButton.female({@required VoidCallback onPressed, bool isSelected = false}) {
    return GenderButton(
      icon: FontAwesomeIcons.venus,
      text: 'FEMALE',
      onPressed: onPressed,
      isSelected: isSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
        onPressed: onPressed,
        color: isSelected ? selectedCardColor : unselectedCardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80),
            SizedBox(height: 15),
            AppLabel(text)
          ],
        ),
    );
  }
}
