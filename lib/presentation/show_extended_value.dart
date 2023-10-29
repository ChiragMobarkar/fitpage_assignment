import 'package:flutter/material.dart';

class ShowExtendedValues extends StatelessWidget {
  const ShowExtendedValues({
    super.key,
    required this.values,
  });

  final List<dynamic> values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: values.length,
          itemBuilder: (_, index) {
            return Text(
              values[index].toString(),
              style: const TextStyle(fontSize: 14.0),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Divider(),
            );
          },
        ),
      ),
    );
  }
}
