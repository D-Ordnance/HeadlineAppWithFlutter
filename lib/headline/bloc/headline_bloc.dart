import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:first_flutter_application/headline/model/head_line_domain.dart';

enum HeadLineActions { getHeadlines }

class HeadLineBloc {
  final _stateStreamController = StreamController<List<HeadLineDomain>>();

  StreamSink<List<HeadLineDomain>> get headLineSink =>
      _stateStreamController.sink;

  Stream<List<HeadLineDomain>> get headLineStream =>
      _stateStreamController.stream;

  final _eventStreamController = StreamController<HeadLineActions>();

  StreamSink<HeadLineActions> get eventSink => _eventStreamController.sink;

  Stream<HeadLineActions> get eventStream => _eventStreamController.stream;

  HeadLineBloc() {

    eventStream.listen((event) async {
      if (event == HeadLineActions.getHeadlines) {
        try {
          var headLines = await getHeadLines();
          print("headlines size is ${headLines.length}");
          headLineSink.add(headLines);
        } on Exception catch (e) {
          headLineSink.addError("Something went wrong with message: $e");
        }
      }
    });
  }

  Future<List<HeadLineDomain>> getHeadLines() async {
    final result = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=US&apiKey=2d021085c2e64c23927ff485d9f4299b'));
    Map<String, dynamic> response = json.decode(result.body);
    if (response["status"] == "ok") {
      List<HeadLineDomain> articles = (response["articles"] as List)
          .map((e) => HeadLineDomain.fromJson(e))
          .toList();
      headLineSink.add(articles);
      return articles;
    } else {
      return List.empty();
    }
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
