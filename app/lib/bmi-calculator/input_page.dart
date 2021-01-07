import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/MainButton.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/gender_selector.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/height_selector.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/number_selector.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/results_page.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/value_listenable_extension.dart';

import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ValueNotifier<Gender> selectGenderNotifier = ValueNotifier(null);
  ValueNotifier<int> selectedHeightNotifier = ValueNotifier(110);
  ValueNotifier<int> selectedWeightNotifier = ValueNotifier(0);
  ValueNotifier<int> selectedAgeNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: selectGenderNotifier.builder(
              (_, selectedGender) => GenderSelector(
                selected: selectedGender,
                onSelect: (gender) => selectGenderNotifier.value = gender,
              ),
            ),
          ),
          Expanded(
            child: selectedHeightNotifier.builder(
              (_, selectedHeight) => HeightSelector(
                value: selectedHeight,
                onChanged: (newHeight) =>
                    selectedHeightNotifier.value = newHeight,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: selectedWeightNotifier.builder(
                    (_, selectedWeight) => NumberSelector(
                      label: 'WEIGHT',
                      value: selectedWeight,
                      onChanged: (newWeight) =>
                          selectedWeightNotifier.value = newWeight,
                    ),
                  ),
                ),
                Expanded(
                    child: selectedAgeNotifier.builder(
                  (_, selectedAge) => NumberSelector(
                    label: 'AGE',
                    value: selectedAge,
                    onChanged: (newAge) => selectedAgeNotifier.value = newAge,
                  ),
                )),
              ],
            ),
          ),
          MainButton(
            onPressed: () {
              CalculatorBrain calculator = CalculatorBrain(
                height: selectedHeightNotifier.value,
                weight: selectedWeightNotifier.value,
              );
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ResultsPage(
                  bmiResult: calculator.calculateBMI(),
                  resultText: calculator.getResult(),
                  interpretation: calculator.getInterpretation(),
                )),
              );
            },
            label: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
