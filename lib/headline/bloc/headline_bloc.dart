import 'dart:async';

import 'package:swipe_refresh/swipe_refresh.dart';

enum CounterAction{
  increment,
  decrement,
  reset
}

class HeadLineBloc{
  late int counter;
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;

  Stream<int> get counterStream => _stateStreamController.stream;


  final _eventStreamController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;

  Stream<CounterAction> get eventStream => _eventStreamController.stream;


  // final _refreshEventStreamController = StreamController<SwipeRefreshState>();

  // StreamSink<SwipeRefreshState> get refreshStateSink => _refreshEventStreamController.sink;

  // Stream<SwipeRefreshState> get refreshStateStream => _refreshEventStreamController.stream;


  HeadLineBloc(){

    // counter = 0;

    // eventStream.listen((event) {
    //   if(event == CounterAction.increment){
    //     counter++;
    //   }
    //   else if(event == CounterAction.decrement){
    //     if(counter != 0)counter--;
    //   }
    //   else if(event == CounterAction.reset){
    //     counter = 0;
    //   }

    //   counterSink.add(counter);
    // });

    
  }
}