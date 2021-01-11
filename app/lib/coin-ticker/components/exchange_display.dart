import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/coin-ticker/coin_data.dart';

class ExchangeDisplay extends StatelessWidget {
  const ExchangeDisplay({
    Key key,
    @required this.cryptoCurrency,
    @required this.selectedCurrency,
  }) : super(key: key);

  final String cryptoCurrency;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: FutureBuilder<double>(
            future:
                CoinService.getExchangeRate(cryptoCurrency, selectedCurrency),
            builder: (context, snapshot) => _ExchangeText(
              cryptoCurrency: cryptoCurrency,
              selectedCurrency: selectedCurrency,
              exchangeRate: snapshot.data,
            ),
          ),
        ),
      ),
    );
  }
}

class _ExchangeText extends StatelessWidget {
  const _ExchangeText({
    Key key,
    @required this.exchangeRate,
    @required this.cryptoCurrency,
    @required this.selectedCurrency,
  }) : super(key: key);

  final double exchangeRate;
  final String cryptoCurrency;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    String exchangeRate =
        this.exchangeRate != null ? this.exchangeRate.toStringAsFixed(2) : '?';
    return Text(
      '1 $cryptoCurrency = $exchangeRate $selectedCurrency',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }
}
