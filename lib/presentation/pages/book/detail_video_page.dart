import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/application/utils/application_constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideoPage extends StatefulWidget {
  const DetailVideoPage({Key? key}) : super(key: key);

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=0c8SKfErGbg')!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller!,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              onReady: () {
                controller!.addListener(() {});
              },
            ),
            onEnterFullScreen: () {},
            onExitFullScreen: () {},
            builder: (context, player) {
              return player;
            },
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back, color: Colors.black)),
              title: Text('Office Stuff', style: TextStyle(color: Colors.black)),
              centerTitle: true,
            ),
            body: Column(
              children: [
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: controller!,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    onReady: () {
                      controller!.addListener(() {});
                    },
                  ),
                  onEnterFullScreen: () {},
                  onExitFullScreen: () {},
                  builder: (context, player) {
                    return player;
                  },
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'In the Office Stuff',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.share),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(color: Colors.grey[400]),
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
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mrs Farida', style: TextStyle(fontWeight: FontWeight.w600)),
                                  Text('English Lecture'),
                                ],
                              )
                            ],
                          ),
                          Divider(color: Colors.grey[400]),
                          SizedBox(height: 8),
                          Text(lorem)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
