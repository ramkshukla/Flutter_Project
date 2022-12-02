import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sirius/home.dart';

void main() {
  testWidgets('testing tutorial', (widgetTester) async {
    Widget widget = MaterialApp(
      title: 'Testing',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'This is counter app',
      ),
    );
    await widgetTester.pumpWidget(widget);
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byType(FloatingActionButton));
  });
}
