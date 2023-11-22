import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Currency Converter'))),
        body: const Currency(),
      ),
    );
  }
}

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  @override
  double usdAmount = 0;
  double inrAmount = 0;
  final double rate = 83;
  void convert() {
    setState(() {
      inrAmount = usdAmount * rate;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'USD Amount',
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.circular(50))),
          onChanged: (value) {
            usdAmount = double.tryParse(value) ?? 0;
          },
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 55,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              convert();
            },
            child: Text(
              'Convert',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Amount:₹ $inrAmount',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
