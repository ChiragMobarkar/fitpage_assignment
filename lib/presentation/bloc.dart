import 'package:bloc/bloc.dart';
import 'package:fitpage_assignment/data/api_client.dart';

import '../domain/rule.dart';

class RuleBloc extends Cubit<List<Rule>> {
  RuleBloc() : super([]);

  Future<void> fetchRules() async {
    final rules = await ApiClient.singleton
        .fetchData('http://coding-assignment.bombayrunning.com/data.json');
    emit(rules);
  }
}
