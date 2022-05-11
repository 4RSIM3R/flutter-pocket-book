import 'package:flutter/material.dart';
import 'package:pocket_books/presentation/components/domain/home/home_audio_cad.dart';

class HomeAudioLayout extends StatelessWidget {
  const HomeAudioLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAudioCard(title: 'Ngobrolin Startup', author: 'Gus Imre Nagi'),
          HomeAudioCard(title: 'Ngobrolin Startup', author: 'Gus Imre Nagi'),
          HomeAudioCard(title: 'Ngobrolin Startup', author: 'Gus Imre Nagi'),
          HomeAudioCard(title: 'Ngobrolin Startup', author: 'Gus Imre Nagi'),
        ],
      ),
    );
  }
}