import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/coin-ticker/coin_data.dart';
import 'package:flutter_dev_bootcamp/coin-ticker/components/currency_selector.dart';
import 'package:flutter_dev_bootcamp/coin-ticker/components/exchange_display.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (String cryptoCurrency in cryptoList)
                ExchangeDisplay(cryptoCurrency: cryptoCurrency, selectedCurrency: selectedCurrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CurrencySelector(
              selected: selectedCurrency,
              onChanged: (newCurrency) {
                setState(() {
                  selectedCurrency = newCurrency;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
