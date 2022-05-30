import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

class HomeVideoCard extends StatelessWidget {
  const HomeVideoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.detailVideo);
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
                'https://www.ipsos.com/sites/default/files/ct/news_and_polls/2021-07/man-at-work-unhappy.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Chapter 3', style: TextStyle(color: Colors.white)),
                Text('05:42', style: TextStyle(color: Colors.white))
              ],
            ),
            Text('Office Stuff', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)),
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
                          'https://scontent-cgk1-2.xx.fbcdn.net/v/t1.6435-9/83898456_2716385475109597_947653129061531648_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEw-Ccr3kAoHNxMA8FNZHIn3pw8FnCfXUrenDwWcJ9dSidOD_XkSFndj6rE_L_zvfTWPvM_CAocQd0z4s-DUWd-&_nc_ohc=QIWzbeETCZ0AX9j2NcP&_nc_ht=scontent-cgk1-2.xx&oh=00_AT8Qelj2pgNxSWz5HploOICtIkedTmBI142unxEFAWvBxQ&oe=62B904FC'),
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
