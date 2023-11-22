import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(children: [
                    Text(
                      "300.98 ° K",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.cloud,
                      size: 72,
                    ),
                    Text(
                      "Rain",
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
              ),
            ),
            const Expanded(
              child: Placeholder(
                color: Colors.orange,
              ),
            ),
            const Expanded(
              child: Placeholder(
                color: Colors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
