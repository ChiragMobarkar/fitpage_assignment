import 'package:fitpage_assignment/presentation/show_extended_value.dart';
import 'package:fitpage_assignment/presentation/show_period_value.dart';
import 'package:fitpage_assignment/presentation/type/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../domain/criteria.dart';
import '../domain/rule.dart';

class StockDetailsScreen extends StatefulWidget {
  final Rule rule;

  const StockDetailsScreen({
    super.key,
    required this.rule,
  });

  @override
  State<StockDetailsScreen> createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen> {
  late Rule rule;

  @override
  void initState() {
    super.initState();

    rule = widget.rule;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rule.name,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              rule.tag,
              style: TextStyle(
                fontSize: 14,
                color: AppColorsEnum.colors(rule.color),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            for (var index = 0; index < rule.criteria.length; index++)
              if (rule.criteria[index].type == CriteriaType.plain) ...[
                Text(
                  rule.criteria[index].text.replaceAll("â", "'"),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ] else ...[
                RichText(
                  text: TextSpan(
                    children: createClickableTextSpans(
                      text: rule.criteria[index].text.replaceAll("â", "'"),
                      variables: rule.criteria[index].variable,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                if (index != rule.criteria.length - 1)
                  const Text(
                    "and",
                    style: TextStyle(fontSize: 12),
                  ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
          ],
        ),
      ),
    );
  }

  List<TextSpan> createClickableTextSpans(
      {required String text, required Map<String, dynamic>? variables}) {
    final List<TextSpan> textSpans = [];
    final RegExp pattern = RegExp(r'\$[0-9]+');

    int start = 0;
    for (final match in pattern.allMatches(text)) {
      if (start < match.start) {
        textSpans.add(
          TextSpan(
            text: text.substring(start, match.start),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      }

      final matchedValue = match.group(0);
      textSpans.add(TextSpan(
        text: matchedValue,
        style: const TextStyle(
          color:
              Colors.blue, // Customize the text color for the clickable part.
          decoration: TextDecoration.underline, // Underline the text.
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            final variable = variables?[matchedValue];

            if (variable['type'].toString().toLowerCase() == "value") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShowExtendedValues(values: variable['values']),
                ),
              );
            } else if (variable['type'].toString().toLowerCase() ==
                "indicator") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowPeriodValue(values: variable),
                ),
              );
            }
          },
      ));

      start = match.end;
    }

    if (start < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(start),
        ),
      );
    }

    return textSpans;
  }
}
