enum CriteriaType {
  plain(rawValue: "plain_text"),
  variable(rawValue: "variable"),
  none(rawValue: "none");

  const CriteriaType({required this.rawValue});

  final String rawValue;
}

extension CriteriaTypeEnum on CriteriaType {
  CriteriaType get name {
    switch (this) {
      case CriteriaType.plain:
        return CriteriaType.plain;
      case CriteriaType.variable:
        return CriteriaType.variable;
      case CriteriaType.none:
        return CriteriaType.none;
    }
  }
}

class Criteria {
  final CriteriaType type;
  final String text;
  final Map<String, dynamic>? variable;

  Criteria({
    required this.type,
    required this.text,
    this.variable,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) {
    CriteriaType type =
        CriteriaType.values.firstWhere((e) => e.rawValue == json['type']);

    return Criteria(
      type: type,
      text: json['text'],
      variable: json['variable'] != null
          ? Map<String, dynamic>.from(json['variable'])
          : null,
    );
  }
}
