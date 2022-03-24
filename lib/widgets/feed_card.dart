import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      // color: Colors.red,
      width:  size.width * 0.9,
      height: size.width * 0.35,
      margin: const EdgeInsets.all(8),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Placeholder(
              fallbackHeight: size.width * 0.4,
              fallbackWidth: size.width * 0.35,
            ),
            SizedBox(
              width: size.width *0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Some cool title",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(DateFormat.yMMMd().format(DateTime.parse("2022-03-21T17:35:01.859728Z")),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text("some crazy text "*25,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _WigglyWidget(icon: Icons.all_inclusive, count: 132),
                      _WigglyWidget(icon: Icons.favorite, count: 132),
                      _WigglyWidget(icon: Icons.comment, count: 132),
                    ],
                  )
                ],
              ),
            ),
          ],
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
        Text(count.toString())
      ],
    );
  }
}
