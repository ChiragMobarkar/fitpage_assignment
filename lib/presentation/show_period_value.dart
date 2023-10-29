import 'package:flutter/material.dart';

class ShowPeriodValue extends StatelessWidget {
  const ShowPeriodValue({
    super.key,
    required this.values,
  });

  final Map<String, dynamic> values;

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
              values["study_type"].toString().toUpperCase(),
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              'Set Parameters',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              children: [
                Text(
                  values["parameter_name"].toString().capitalize(),
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: values["default_value"].toString(),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
