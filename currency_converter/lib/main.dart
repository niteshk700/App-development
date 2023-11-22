import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Currency Converter')),
        ),
        body: ConverterWidget(),
      ),
    );
  }
}

class ConverterWidget extends StatefulWidget {
  @override
  _ConverterWidgetState createState() => _ConverterWidgetState();
}

class _ConverterWidgetState extends State<ConverterWidget> {
  double usdAmount = 0;
  double inrAmount = 0;
  final double conversionRate = 82.0;

  void convertCurrency() {
    setState(() {
      inrAmount = usdAmount * conversionRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'USD Amount',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10))),
            onChanged: (value) {
              setState(() {
                usdAmount = double.tryParse(value) ??
                    0; // Handle invalid input gracefully
              });
            },
          ),
          SizedBox(height: 16.0),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: Text(
                'Convert',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(height: 16.0),
          Text('Amount: ₹ $inrAmount', style: TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }
}
