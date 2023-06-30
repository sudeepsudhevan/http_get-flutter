import 'dart:convert';

import 'package:http/http.dart';
import 'package:webgetpost/number_fact_resp/number_fact_resp.dart';

Future<NumberFactResp> getNumberFact({required int num}) async {
  final _response = await get(Uri.parse('http://numbersapi.com/$num?json'));
  //final _bodyAsJson = jsonEncode(_response.body);
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = NumberFactResp.fromJson(_bodyAsJson);
  return _data;
}

//dart run build_runner watch --use-polling-watcher --delete-conflicting-outputs