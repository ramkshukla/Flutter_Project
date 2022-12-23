import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/provider/counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    final count = counter.count;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$count',
                style: const TextStyle(fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    onPressed: () {
                      counter.increment();
                    },
                    child: const Icon(Icons.plus_one),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    onPressed: () {
                      counter.decrement();
                    },
                    child: const Icon(Icons.exposure_minus_1_outlined),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
