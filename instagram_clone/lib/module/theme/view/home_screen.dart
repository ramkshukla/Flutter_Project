import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/module/theme/controller/theme_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Theme"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SwitchListTile(
                  value: state.themeButton,
                  onChanged: (value) {
                    if (value == true) {
                      context.read<ThemeBloc>().add(DarkMode());
                    } else {
                      context.read<ThemeBloc>().add(LightMode());
                    }
                  },
                  title: const Text("Toggle theme"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
