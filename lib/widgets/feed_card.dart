import 'package:flutter/material.dart';
import 'package:tyncad_test/models/feed.dart';


class FeedCard extends StatelessWidget {
  // final Feed feed;
  const FeedCard({
    Key? key,
    // required this.feed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.red,
      margin: const EdgeInsets.all(8),
      child: Card(
        child: SizedBox(
          width:  size.width * 0.9,
          height: size.height * 0.35,
        ),
      ),
    );
  }
}
