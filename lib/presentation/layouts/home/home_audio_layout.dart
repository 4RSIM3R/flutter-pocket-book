import 'package:flutter/material.dart';
import 'package:pocket_books/application/utils/application_constant.dart';
import 'package:pocket_books/presentation/components/domain/home/home_audio_card.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

import '../../../model/audio_model.dart';

class HomeAudioLayout extends StatefulWidget {
  const HomeAudioLayout({Key? key}) : super(key: key);

  @override
  State<HomeAudioLayout> createState() => _HomeAudioLayoutState();
}

class _HomeAudioLayoutState extends State<HomeAudioLayout> {
  final mapImages = {
    "Great Idioms Expressions for Negotiations":
        "https://www.incimages.com/uploaded_files/image/1920x1080/shutterstock_645246526_351270.jpg",
    "How To Be More Diplomatic & Polite":
        "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    "Phrases For Leading a Business Meeting":
        "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    "Must-Have English Phrases for Online Meetings":
        "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Audio Pratices',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Column(
              children: audios.keys
                  .map(
                    (e) => HomeAudioCard(
                      model: AudioModel(
                        'https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsforNegotiations.mp3',
                        'https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsforNegotiations.srt',
                        e,
                        mapImages[e] ??
                            "https://www.incimages.com/uploaded_files/image/1920x1080/shutterstock_645246526_351270.jpg",
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.menuAudio, arguments: audios[e]);
                      },
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
