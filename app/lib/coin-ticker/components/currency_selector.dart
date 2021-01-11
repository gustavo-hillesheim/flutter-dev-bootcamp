import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/coin-ticker/coin_data.dart';

class CurrencySelector extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String selected;

  CurrencySelector({@required this.onChanged, this.selected});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _picker : _dropdownButton;
  }

  Widget get _picker => CupertinoPicker(
    itemExtent: 32,
    onSelectedItemChanged: (selectedIndex) =>
        onChanged(currenciesList[selectedIndex]),
    children: _mapCurrencies((currency) => Text(currency)),
  );

  Widget get _dropdownButton => DropdownButton<String>(
    onChanged: onChanged,
    value: selected,
    items: _mapCurrencies((currency) => DropdownMenuItem<String>(
      value: currency,
      child: Text(currency),
    )),
  );

  List<T> _mapCurrencies<T extends Widget>(CurrencyOptionBuilder<T> builder) =>
      currenciesList.map(builder).toList();
}

typedef CurrencyOptionBuilder<T> = T Function(String currency);