import 'package:first_flutter_application/headline/bloc/headline_bloc.dart';
import 'package:first_flutter_application/headline/pages/home_screen.dart';
// import 'package:first_flutter_application/headline/widget/head_line_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final HeadLineBloc _counterBloc = HeadLineBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // HeadLineItem(),
            const Text(
              'You have clicked the button this many times:',
            ),
            StreamBuilder(
              initialData: 0,
              stream: _counterBloc.counterStream,
              builder: (context, snapshot){
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headlineMedium,
                  );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: 
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              _counterBloc.eventSink.add(CounterAction.increment); 
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){
              _counterBloc.eventSink.add(CounterAction.decrement); 
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){
              _counterBloc.eventSink.add(CounterAction.reset); 
            },
            tooltip: 'Increment',
            child: const Icon(Icons.restart_alt),
          ),
        ],
      )
      
    );
  }
}
