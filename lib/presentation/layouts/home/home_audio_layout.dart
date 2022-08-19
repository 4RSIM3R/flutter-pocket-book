import 'package:flutter/material.dart';
import 'package:pocket_books/presentation/components/domain/home/home_audio_card.dart';

import '../../../model/audio_model.dart';

class HomeAudioLayout extends StatelessWidget {
  const HomeAudioLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Audio Books',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            HomeAudioCard(
              model: AudioModel(
                'https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsforNegotiations.mp3',
                'https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsforNegotiations.srt',
                'Expression Of Negotiations',
                'https://www.incimages.com/uploaded_files/image/1920x1080/shutterstock_645246526_351270.jpg'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
