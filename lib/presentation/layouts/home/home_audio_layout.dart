import 'package:flutter/material.dart';
import 'package:pocket_books/presentation/components/domain/home/home_audio_card.dart';

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
              title: 'The 100 trillionth digit of pi',
              author: 'Google Cloud Platform',
              image: 'https://cloud.google.com/podcasts/images/gcp-podcast-thumbnail.jpg',
            ),
            HomeAudioCard(
              title: 'Network Agility for the Cloud Era',
              author: 'Screaming In The Cloud',
              image: 'https://cdns-images.dzcdn.net/images/talk/9f0d591eb65b9a111ea02c269b52ca8b/1000x1000.jpg',
            ),
            HomeAudioCard(
              title: 'The 100 trillionth digit of pi',
              author: 'Google Cloud Platform',
              image: 'https://cloud.google.com/podcasts/images/gcp-podcast-thumbnail.jpg',
            ),
            HomeAudioCard(
              title: 'The 100 trillionth digit of pi',
              author: 'Google Cloud Platform',
              image: 'https://cloud.google.com/podcasts/images/gcp-podcast-thumbnail.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
