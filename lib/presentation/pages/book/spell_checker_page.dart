import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pocket_books/application/subtitle/bloc/subtitle_bloc.dart';
import 'package:quiver/async.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/subtitle/model/subtitle_model.dart';

class SpellCheckerPage extends StatefulWidget {
  const SpellCheckerPage({Key? key}) : super(key: key);

  @override
  State<SpellCheckerPage> createState() => _SpellCheckerPageState();
}

class _SpellCheckerPageState extends State<SpellCheckerPage> {
  final bloc = SubtitleBloc();

  final controller = ScrollController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // bloc.loadSubtitle();
  }

  Future playSubtitle(List<SubtitleModels> models) async {

    setState(() {
      currentIndex = 0;
    });

    for (var model in models) {
      final diff = model.endTime.inMilliseconds - model.startTime.inMilliseconds;
      await Future.delayed(Duration(milliseconds: diff));
      print(diff);
      setState(() {
        currentIndex += 1;
      });
      controller.animateTo((15.0 * currentIndex), duration: Duration(milliseconds: 250), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Speech Recognition Challenge',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              CommunityMaterialIcons.comment_question,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CommunityMaterialIcons.text_to_speech,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<SubtitleBloc, SubtitleState>(
                bloc: bloc,
                builder: (context, state) {
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
                    return Column(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          height: MediaQuery.of(context).size.height / 2,
                          width: double.infinity,
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                                        color: payload!.indexOf(e) == currentIndex
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 4.5),
                        // Expanded(child: Container()),
                        Center(
                          child: InkWell(
                            onTap: () {
                              // final result = subtitleRepository.parseSrt(
                              //   url: 'https://api.kontenbase.com/upload/file/628cf4cbdb20c52857fb0b75/jVHCcPtB/example.srt',
                              // );
                              playSubtitle(payload!);
                            },
                            child: Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
              // Center(
              //   child: Container(
              //     height: 240,
              //     child: ListView(
              //       controller: controller,
              //       physics: NeverScrollableScrollPhysics(),
              //       scrollDirection: Axis.vertical,
              //       children: words.asMap().entries.map((e) {
              //         return Text(
              //           e.value,
              //           style: e.key == firstIndex
              //               ? TextStyle(
              //                   fontSize: 30,
              //                   fontWeight: FontWeight.w600,
              //                   color: Colors.black,
              //                 )
              //               : TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w600,
              //                   color: Colors.black12,
              //                 ),
              //         );
              //       }).toList(),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
