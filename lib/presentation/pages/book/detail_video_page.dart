import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/application/utils/application_constant.dart';
import 'package:pocket_books/model/video_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideoPage extends StatefulWidget {
  const DetailVideoPage({Key? key, this.model}) : super(key: key);

  final VideoModel? model;

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.model!.videoUrl)!,
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
              title: Text(widget.model?.videoTitle ?? '-', style: TextStyle(color: Colors.black)),
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
                              Expanded(
                                child: Text(
                                  widget.model?.videoDescription ?? '-',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
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
                                      'https://i1.rgstatic.net/ii/profile.image/715140370542594-1547514159610_Q512/Farida-Ulfa.jpg',
                                    ),
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
                          Text(widget.model?.videoDescription ?? '-'),
                          // Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),
                ),
                widget.model!.questionLink.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(18),
                      child: InkWell(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(widget.model!.questionLink))) {
                              throw 'Could not launch url';
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Open Questionere',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                    )
                    : Container()
              ],
            ),
          );
        }
      },
    );
  }
}
