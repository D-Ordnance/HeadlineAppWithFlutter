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
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsFeed"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              heightFactor: 0.5,
              child: Text(
                "Top News",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: RefreshIndicator(
            onRefresh: () async {
                return _headlineBloc.eventSink.add(HeadLineActions.getHeadlines);
            },
            child: StreamBuilder<List<HeadLineDomain>>(
              initialData: List.empty(),
              stream: _headlineBloc.headLineStream,
              builder: (context, snapshot) {
                // if(snapshot.hasError){
                //   print("Snap shot error ${snapshot.error}");
                // }
                return ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                  itemBuilder: (context, index) =>
                      HeadLineItem(model: snapshot.data![index]),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
