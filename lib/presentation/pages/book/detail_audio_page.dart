import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:pocket_books/application/book/bloc/player_listener.dart';
import 'package:pocket_books/application/utils/application_constant.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/subtitle/bloc/subtitle_bloc.dart';

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  final audioPlayer = AudioPlayer();
  final playerListener = PlayerListener();
  final bloc = SubtitleBloc();

  final controller = ScrollController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    bloc.loadSubtitle();
    initAudioPlayer();
    listenPlayButtonState();
  }

  Future<void> initAudioPlayer() async {
    await audioPlayer.setUrl(exampleSound);
  }

  void listenPlayButtonState() {
    audioPlayer.playerStateStream.listen((event) {
      final isPlaying = audioPlayer.playing;
      final processingState = audioPlayer.processingState;
      if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
        playerListener.playButtonNotifier.value = PlayButtonState.loading;
      } else if (!isPlaying) {
        playerListener.playButtonNotifier.value = PlayButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playerListener.playButtonNotifier.value = PlayButtonState.playing;
      } else {
        playerListener.playButtonNotifier.value = PlayButtonState.playing;
      }
    });

    audioPlayer.positionStream.listen((position) {
      final oldState = playerListener.progressNotifier.value;
      playerListener.progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = playerListener.progressNotifier.value;
      playerListener.progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    audioPlayer.durationStream.listen((totalDuration) {
      final oldState = playerListener.progressNotifier.value;
      playerListener.progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void listenProgresBarState() {}

  void seek(Duration position) {
    audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back, color: Colors.black)),
          title: Text('Office Stuff', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<SubtitleBloc, SubtitleState>(builder: (context, state) {
                  if (state.runtimeType == SubtitleLoading) {
                    return AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.infinity,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!.withOpacity(0.4),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12),
                              width: double.infinity,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!.withOpacity(0.4),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12),
                              width: double.infinity,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!.withOpacity(0.4),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12),
                              width: double.infinity,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state.runtimeType == SubtitleFailure) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LottieBuilder.network(
                            'https://assets8.lottiefiles.com/packages/lf20_bhw1ul4g.json',
                            height: 225,
                            width: 225,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 12),
                          Text('Error Message Here', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
                        ],
                      ),
                    );
                  } else {
                    final payload = (state as SubtitleSuccess).payload;
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(18),
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (payload ?? [])
                              .map(
                                (e) => Text(
                                  e.text,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: payload!.indexOf(e) <= currentIndex
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  }
                }),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 64),
                    Text(
                      'Office Stuff',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Chapter 3',
                      style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    SizedBox(height: 24),
                    ValueListenableBuilder<ProgressBarState>(
                      valueListenable: playerListener.progressNotifier,
                      builder: (context, value, child) {
                        return ProgressBar(
                          progress: value.current,
                          total: value.total,
                          buffered: value.buffered,
                          progressBarColor: Colors.blueAccent,
                          thumbColor: Colors.blue,
                          baseBarColor: Colors.grey[200],
                          bufferedBarColor: Colors.grey,
                          barHeight: 3,
                          timeLabelPadding: 8,
                          onSeek: seek,
                        );
                      },
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous, color: Colors.black, size: 36)),
                        SizedBox(width: 24),
                        ValueListenableBuilder<PlayButtonState>(
                          valueListenable: playerListener.playButtonNotifier,
                          builder: (context, value, child) {
                            if (value == PlayButtonState.loading) {
                              return Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(color: Colors.white),
                                  ),
                                ),
                              );
                            } else if (value == PlayButtonState.paused) {
                              return Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    audioPlayer.play();
                                  },
                                  icon: Icon(Icons.play_arrow, color: Colors.white, size: 36),
                                ),
                              );
                            } else {
                              return Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    audioPlayer.pause();
                                  },
                                  icon: Icon(Icons.pause, color: Colors.white, size: 36),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(width: 24),
                        IconButton(onPressed: () {}, icon: Icon(Icons.skip_next, color: Colors.black, size: 36))
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
