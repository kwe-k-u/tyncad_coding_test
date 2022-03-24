import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tyncad_test/models/feed.dart';
import 'package:tyncad_test/screens/feed_details/feed_details.dart';


class FeedCard extends StatelessWidget {
  final Feed feed;
  const FeedCard({
    Key? key,
    required this.feed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: (){
        Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> FeedDetails(id: feed.id)
            )
        );
      },
      child: Container(
        width:  size.width * 0.9,
        height: size.width * 0.35,
        margin: const EdgeInsets.all(8),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Image.network(feed.coverPhoto,
              width: size.width * 0.38,
                height: size.width * 0.33,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: size.width *0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(feed.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(DateFormat.yMMMd().format(feed.dateCreated),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(feed.description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _WigglyWidget(icon: Icons.all_inclusive, count: feed.shareCount),
                        _WigglyWidget(icon: Icons.favorite, count: feed.likeCount),
                        _WigglyWidget(icon: Icons.comment, count: feed.commentCount),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






class _WigglyWidget extends StatelessWidget {
  final IconData icon;
  final int count;
  const _WigglyWidget({
    Key? key,
    required this.icon,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 2,),
        Text(count.toString())
      ],
    );
  }
}
