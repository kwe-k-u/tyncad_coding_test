import 'package:flutter/material.dart';
import 'package:tyncad_test/models/feed.dart';
import 'package:tyncad_test/screens/profile_screen/profile_screen.dart';
import 'package:tyncad_test/widgets/custom_text_field.dart';
import 'package:tyncad_test/widgets/feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomTextField(
          hintIcon: Icons.search,
          hintText: "Search post",
          controller: searchController,
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const ProfileScreen()
                    )
                );
              },
              icon: Icon(Icons.account_circle)
          )
        ],
      ),
        body: Container(
        child: ListView(
          children: List.generate(12, (index) => FeedCard()),
        )
        )
    );
  }
}
