import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:state_app/module/provider_app/provider/counter_provider.dart';
import 'package:state_app/module/provider_app/view/counter.dart';

class MyProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      child: const CounterPage(),
      create: (_) => CounterProvider(),
    );
  }
}
