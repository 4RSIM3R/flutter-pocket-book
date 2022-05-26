import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class DetailAudioPage extends StatelessWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(18),
              ),
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
                  Text('Chapter 3', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w600, fontSize: 14),),
                  SizedBox(height: 24),
                  ProgressBar(
                    progress: Duration.zero,
                    total: Duration.zero,
                    progressBarColor: Colors.blueAccent,
                    thumbColor: Colors.blue,
                    baseBarColor: Colors.grey[200],
                    barHeight: 3,
                    timeLabelPadding: 8,
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous, color: Colors.black, size: 36)),
                      SizedBox(width: 24),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow, color: Colors.white, size: 36)),
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
    );
  }
}
