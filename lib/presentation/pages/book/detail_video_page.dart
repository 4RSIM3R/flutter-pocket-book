import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/model/video_model.dart';
import 'package:share_plus/share_plus.dart';
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
  void dispose() {
    controller!.dispose();
    super.dispose();
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
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black)),
              title: Text(widget.model?.videoTitle ?? '-', style: const TextStyle(color: Colors.black)),
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
                const SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.model?.videoTitle ?? '-',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Share.share(widget.model!.videoUrl);
                                },
                                icon: const Icon(Icons.share),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
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
                                  image: const DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      'https://img.freepik.com/free-vector/digital-presentation-abstract-illustration_335657-4996.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('English Lecture Team', style: TextStyle(fontWeight: FontWeight.w600)),
                                  Text('State Polytechnic Malang'),
                                ],
                              )
                            ],
                          ),
                          Divider(color: Colors.grey[400]),
                          const SizedBox(height: 8),
                          Text(widget.model?.videoDescription ?? '-'),
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
                            child: const Center(
                              child: Text(
                                'Follow Up Question',
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
