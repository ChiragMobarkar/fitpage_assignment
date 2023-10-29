class Variable {
  final String? type;
  final String? text;
  final String? studyType;
  final String? parameterName;
  final String? minValue;
  final String? maxValue;
  final String? defaultValue;
  final List<int>? values;

  Variable({
    this.type,
    this.text,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
    this.values,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      type: json['type'],
      text: json['text'],
      studyType: json['studyType'],
      parameterName: json['parameterName'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      defaultValue: json['defaultValue'],
      values: (json['values'] as List<dynamic>?)?.cast<int>(),
    );
  }
}
