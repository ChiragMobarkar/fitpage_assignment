import 'package:fitpage_assignment/presentation/stocks_details_screen.dart';
import 'package:fitpage_assignment/presentation/type/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/rule.dart';
import 'bloc.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({
    super.key,
  });

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
  final ruleBloc = RuleBloc();

  @override
  void initState() {
    super.initState();
    ruleBloc.fetchRules();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ruleBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Stocks List"),
        ),
        body: BlocBuilder<RuleBloc, List<Rule>>(
          builder: (context, rules) {
            if (rules.isEmpty) {
              return const Center(
                child: Text('Oops!! Something went wrong'),
              );
            } else {
              return ListView.separated(
                itemCount: rules.length,
                itemBuilder: (context, index) {
                  final rule = rules[index];
                  return ListTile(
                    title: Text(
                      rule.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      rule.tag,
                      style: TextStyle(
                        color: AppColorsEnum.colors(rule.color),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StockDetailsScreen(rule: rule),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            }
          },
        ),
      ),
    );
  }
}
