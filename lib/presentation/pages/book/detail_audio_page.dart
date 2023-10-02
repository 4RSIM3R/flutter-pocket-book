import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:pocket_books/application/book/bloc/player_listener.dart';
import 'package:pocket_books/model/audio_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/subtitle/bloc/subtitle_bloc.dart';
import '../../../application/subtitle/model/subtitle_model.dart';

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key, required this.model}) : super(key: key);

  final AudioModel model;

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  final audioPlayer = AudioPlayer();
  final playerListener = PlayerListener();
  final bloc = SubtitleBloc();

  final controller = ScrollController();

  int currentIndex = 0;

  bool playingSubtitle = false;

  @override
  void initState() {
    super.initState();
    bloc.loadSubtitle(widget.model.srtUrl);
    initAudioPlayer();
    listenPlayButtonState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> initAudioPlayer() async {
    await audioPlayer.setUrl(widget.model.audioUrl);
  }

  void listenPlayButtonState() {
    audioPlayer.playerStateStream.listen((event) {
      final isPlaying = audioPlayer.playing;
      final processingState = audioPlayer.processingState;
      if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
        playerListener.playButtonNotifier.value = PlayButtonState.loading;
      } else if (!isPlaying) {
        playerListener.playButtonNotifier.value = PlayButtonState.paused;
        setState(() {
          playingSubtitle = false;
        });
      } else if (processingState != ProcessingState.completed) {
        playerListener.playButtonNotifier.value = PlayButtonState.playing;
        setState(() {
          playingSubtitle = false;
        });
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

  void seek(Duration position) {
    audioPlayer.seek(position);
  }

  Future playSubtitle(List<SubtitleModels> models) async {
    print(playingSubtitle);

    while (playingSubtitle == true) {
      for (var model in models) {
        final diff = model.endTime.inMilliseconds - model.startTime.inMilliseconds;
        await Future.delayed(Duration(milliseconds: diff));
        setState(() {
          currentIndex += 1;
        });
        if (currentIndex % 5 == 0) {
          controller.animateTo((35.0 * currentIndex),
              duration: const Duration(milliseconds: 250), curve: Curves.linear);
        } else {
          controller.animateTo((30.0 * currentIndex),
              duration: const Duration(milliseconds: 250), curve: Curves.linear);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: WillPopScope(
        onWillPop: () async {
          await audioPlayer.pause();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: Text(widget.model.title, style: const TextStyle(color: Colors.black)),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: BlocBuilder<SubtitleBloc, SubtitleState>(
                    builder: (context, state) {
                      if (state.runtimeType == SubtitleLoading) {
                        return AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
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
                                  margin: const EdgeInsets.only(bottom: 12),
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
                                  margin: const EdgeInsets.only(bottom: 12),
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
                                  margin: const EdgeInsets.only(bottom: 12),
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
                        return Center(
                          child: SizedBox(
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
                                const SizedBox(height: 12),
                                const Text(
                                  'Error Message Here',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
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
                          padding: const EdgeInsets.all(18),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (payload ?? [])
                                  .map(
                                    (e) => Text(
                                      e.text,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 64),
                      Text(
                        widget.model.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 24),
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
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.skip_previous, color: Colors.black, size: 36),
                          ),
                          const SizedBox(width: 24),
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
                                  child: const Center(
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(color: Colors.white),
                                    ),
                                  ),
                                );
                              } else if (value == PlayButtonState.paused) {
                                return BlocBuilder<SubtitleBloc, SubtitleState>(
                                  builder: (context, state) {
                                    if (state.runtimeType == SubtitleSuccess) {
                                      // final payload = (state as SubtitleSuccess).payload;
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
                                          icon: const Icon(Icons.play_arrow, color: Colors.white, size: 36),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                );
                              } else {
                                return BlocBuilder<SubtitleBloc, SubtitleState>(
                                  builder: (context, state) {
                                    if (state.runtimeType == SubtitleSuccess) {
                                      // final payload = (state as SubtitleSuccess).payload;
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
                                          icon: const Icon(Icons.pause, color: Colors.white, size: 36),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 24),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next, color: Colors.black, size: 36))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
