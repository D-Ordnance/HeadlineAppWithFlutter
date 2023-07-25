import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_flutter_application/headline/model/head_line_domain.dart';
import 'package:first_flutter_application/headline/pages/web_screen.dart';
import 'package:flutter/material.dart';

class HeadLineItem extends StatelessWidget {
  final HeadLineDomain model;

  HeadLineItem({required this.model});

  ///For reference
  /// Check LimitedBox, SizeBox,
  /// FractionallySizedBox and ConstrainedBox
  /// All State management tools I have heard of
  /// for flutter are BloC, MobX, Riverpod, Provider, Inherited Widget,
  /// GetX, Cube.

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home:
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  WebPage(webUrl: model.url!, title: model.title!))),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              model.urlToImage != null
                  ? model.urlToImage!
                  : "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://d1i4t8bqe7zgj6.cloudfront.net/06-07-2023/t_4c4834f1952a4320b8b35e809127a698_name_nyc_haze.png&w=1440",
            ),
            // image: AssetImage('lib/images/dagger2_sample_image.webp'),
          ),
        ),
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 110, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title != null ? model.title! : "NEWS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    model.author != null ? model.author! : "Anonymous",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
