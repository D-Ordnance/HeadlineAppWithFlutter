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
  final List<HeadLineDomain> _hardCoded = [
    HeadLineDomain(
        author: ", USA TODAY",
        title:
            "Ukraine live updates: Russia says it sank Ukraine's last warship - USA TODAY",
        url:
            "https://www.usatoday.com/story/news/world/2023/05/31/ukraine-russia-live-war-updates/70272228007/",
        urlToImage:
            "https://www.gannett-cdn.com/presto/2023/05/31/USAT/8851a2b6-bd60-410d-aefb-6fffa309ad35-AP_Russia_Ukraine_War_Military_Aid.jpg?auto=webp&crop=5999,3375,x0,y0&format=pjpg&width=1200"),
    HeadLineDomain(
        author: "Lisa Mascaro, Kevin Freking, Stephen Groves",
        title:
            "As House debt ceiling vote nears, Biden shores up Democrats and McCarthy scrambles for GOP support - The Associated Press",
        url:
            "https://apnews.com/article/debt-limit-biden-mccarthy-house-votes-9375cce9b7526b2d0a5728f8d4a18a0a",
        urlToImage:
            "https://storage.googleapis.com/afs-prod/media/05196ab598a5492c81fe69f2bd93a089/3000.jpeg"),
    HeadLineDomain(
        author: "Lillian Rizzo",
        title:
            "MLB will broadcast San Diego Padres games after Diamond Sports stops payments - CNBC",
        url:
            "https://www.usatoday.com/story/news/world/2023/05/31/ukraine-russia-live-war-updates/70272228007/",
        urlToImage:
            "https://image.cnbcfm.com/api/v1/image/106908751-1625832126035-gettyimages-1233880803-Nationals_Padres_Baseball.jpeg?v=1685546355&w=1920&h=1080"),
    HeadLineDomain(
        author: "Sven Sundgaard",
        title:
            "Thunderstorm chances linger with steamy temps, dew points - MPR News",
        url:
            "https://www.usatoday.com/story/news/world/2023/05/31/ukraine-russia-live-war-updates/70272228007/",
        urlToImage:
            "https://img.apmcdn.org/682842bc37cfa238cc246b0ce3bfd3fbbd21c88d/uncropped/766995-20230531-wed-pop-webp420.webp"),
    HeadLineDomain(
        author: "Jeffry Bartash",
        title:
            "Job openings rise to 3-month high and keep pressure on the Fed - MarketWatch",
        url:
            "https://www.usatoday.com/story/news/world/2023/05/31/ukraine-russia-live-war-updates/70272228007/",
        urlToImage:
            "https://images.mktw.net/im-791514/social"),
  ];
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
            onRefresh: () {
              return Future(() => null);
            },
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _hardCoded.length,
              itemBuilder: (context, index) =>
                  HeadLineItem(model: _hardCoded[index]),
            ),
          ))
        ],
      ),
    );
  }
}
