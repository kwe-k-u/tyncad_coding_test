import 'package:flutter/material.dart';
import 'package:tyncad_test/models/app_state.dart';
import 'package:tyncad_test/models/feed.dart';
import 'package:tyncad_test/screens/profile_screen/profile_screen.dart';
import 'package:tyncad_test/services/api.dart';
import 'package:tyncad_test/widgets/custom_text_field.dart';
import 'package:tyncad_test/widgets/feed_card.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TextEditingController searchController = TextEditingController(text: "");

  String _text = "";


  @override
  void initState() {
    super.initState();
    // searchController.addListener(() {print(searchController.text);});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomTextField(
          hintIcon: Icons.search,
          hintText: "Search post",
          controller: searchController,
          onChange: (val){
            setState(() {
              _text = val;
            });
          },

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
        body: FutureBuilder<List<Feed>>(
          future: Api().filterFeed(token: context.read<AppState>().token, filter: _text),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done) {
              List<Feed> _feed = snapshot.data ?? [];
              return _feed.isNotEmpty ?
               ListView(
                children: List.generate(_feed.length, (index) => FeedCard(feed: _feed[index],)),
              )
              :  Center(child: Text("No results for $_text"),);
            } else {
              return CircularProgressIndicator();
            }
          },
        )
    );
  }
}
