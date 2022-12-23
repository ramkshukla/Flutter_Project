import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/counter_bloc.dart';

class MyBlocPage extends StatelessWidget {
  const MyBlocPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Demo"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '$state',
                  style: const TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.read<CounterBloc>().add(Increment());
                      },
                      child: const Icon(Icons.plus_one),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.read<CounterBloc>().add(Decrement());
                      },
                      child: const Icon(Icons.exposure_minus_1_outlined),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
