import 'package:first_flutter_application/headline/bloc/headline_bloc.dart';
import 'package:first_flutter_application/headline/model/head_line_domain.dart';
import 'package:first_flutter_application/headline/widget/head_line_tile.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});
  @override
  State<MyHomeScreen> createState() {
    return _MyHomeScreenState();
  }
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  HeadLineBloc _headlineBloc = HeadLineBloc();
  @override
  void initState() {
    _headlineBloc.eventSink.add(HeadLineActions.getHeadlines);
    super.initState();
  }

  @override
  void dispose() {
    _headlineBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NewsFeed"),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.black87),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  heightFactor: 0.5,
                  child: Text(
                    "Top News",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () async {
                  return _headlineBloc.eventSink
                      .add(HeadLineActions.getHeadlines);
                },
                child: StreamBuilder<List<HeadLineDomain>>(
                  initialData: List.empty(),
                  stream: _headlineBloc.headLineStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "An error occured\nPlease hit the retry button",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () => _headlineBloc.eventSink
                                .add(HeadLineActions.getHeadlines),
                            child: Text("Retry"),
                          ),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            snapshot.data != null ? snapshot.data!.length : 0,
                        itemBuilder: (context, index) =>
                            HeadLineItem(model: snapshot.data![index]),
                      );
                    }
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
