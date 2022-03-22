import 'package:flutter/material.dart';
import 'package:tyncad_test/models/feed.dart';
import 'package:tyncad_test/widgets/feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: ListView(
          children: List.generate(12, (index) => FeedCard()),
        )
        )
    );
  }
}
