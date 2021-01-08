import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/components/app_card.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/components/app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumberSelector extends StatelessWidget {
  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  const NumberSelector({
    Key key,
    this.value,
    this.label,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLabel(label),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: () {
                onChanged(value - 1);
              }),
              SizedBox(width: 10),
              RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                onChanged(value + 1);
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
