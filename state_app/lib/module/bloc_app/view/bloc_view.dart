import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/counter_bloc.dart';
import 'bloc_ui.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MyBlocPage(),
    );
  }
}
