import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/model/video_model.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

class HomeVideoCard extends StatelessWidget {
  const HomeVideoCard({
    Key? key,
    this.model,
  }) : super(key: key);

  final VideoModel? model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.detailVideo,
          arguments: model,
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 18,
        ),
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              'https://www.ipsos.com/sites/default/files/ct/news_and_polls/2021-07/man-at-work-unhappy.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Chapter 3', style: TextStyle(color: Colors.white)),
            //     Text('05:42', style: TextStyle(color: Colors.white))
            //   ],
            // ),
            Text(
              model?.videoTitle ?? '-',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        'https://i1.rgstatic.net/ii/profile.image/715140370542594-1547514159610_Q512/Farida-Ulfa.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mrs Farida', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    Text('English Lecture', style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
