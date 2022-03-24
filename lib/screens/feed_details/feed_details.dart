import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tyncad_test/models/app_state.dart';
import 'package:tyncad_test/models/feed.dart';
import 'package:tyncad_test/services/api.dart';
import 'package:provider/provider.dart';

class FeedDetails extends StatefulWidget {
  final int id;
  const FeedDetails({Key? key,
    required this.id
  }) : super(key: key);

  @override
  _FeedDetailsState createState() => _FeedDetailsState();
}

class _FeedDetailsState extends State<FeedDetails> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
        body: Container(
        child: FutureBuilder<Feed>(
          future: Api().getFeedDetails(token: context.read<AppState>().token, id: widget.id),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Image.network(snapshot.data!.coverPhoto,
                      height: size.height * 0.35,
                      fit: BoxFit.fitHeight,
                    ),

                    Text(snapshot.data!.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 7,),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.49,
                          child: Row(
                            children: [
                              const Icon(Icons.all_inclusive),
                              Text(snapshot.data!.shareCount.toString()),
                              const Spacer(),
                              const Icon(Icons.favorite),
                              Text(snapshot.data!.likeCount.toString()),
                              const Spacer(),
                              const Icon(Icons.comment),
                              Text(snapshot.data!.commentCount.toString()),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(DateFormat.yMMMd().format(snapshot.data!.dateCreated)),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Text("Description", style: Theme.of(context).textTheme.titleMedium,),
                    Text(snapshot.data!.description),
                  ],
                ),
              );
            }

            return const CircularProgressIndicator();
          },
        )
        )
    );
  }
}
