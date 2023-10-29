import 'package:fitpage_assignment/presentation/type/colors.dart';

import 'criteria.dart';

class Rule {
  final int id;
  final String name;
  final String tag;
  final AppColors color;
  final List<Criteria> criteria;

  Rule({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    final List<dynamic> criteriaList = json['criteria'];
    final List<Criteria> criteria = criteriaList
        .map((criteriaJson) => Criteria.fromJson(criteriaJson))
        .toList();

    AppColors appColors =
        AppColors.values.firstWhere((e) => e.rawValue == json['color']);

    return Rule(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: appColors,
      criteria: criteria,
    );
  }
}
