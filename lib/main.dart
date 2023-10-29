import 'package:flutter/material.dart';

import 'presentation/stocks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final ruleBloc = RuleBloc();

  @override
  void initState() {
    super.initState();
    // ruleBloc.fetchRules();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StocksScreen(),
    );
  }
}
