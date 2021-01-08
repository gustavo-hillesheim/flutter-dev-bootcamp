import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/components/app_card.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/components/app_text.dart';

class HeightSelector extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int value;

  HeightSelector({
    @required this.onChanged,
    this.value = 110,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLabel('HEIGHT'),
          _heightDisplay,
          SliderTheme(
            data: _sliderThemeDataOf(context),
            child: Slider(
              onChanged: (newHeight) => onChanged(newHeight.toInt()),
              value: value.toDouble(),
              min: 0,
              max: 220,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _heightDisplay => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Text(
            value.toString(),
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
          ),
          AppLabel('cm')
        ],
      );

  SliderThemeData _sliderThemeDataOf(BuildContext context) =>
      SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Color(0xFF8D8E98),
        overlayColor: Color(0x29EB1555),
        thumbColor: Color(0xFFEB1555),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
      );
}
