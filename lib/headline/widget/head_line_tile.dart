import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_flutter_application/headline/model/head_line_domain.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            model.urlToImage,
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
                  model.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  model.author,
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
    );
  }
}
