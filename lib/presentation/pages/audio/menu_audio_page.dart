import 'package:flutter/material.dart';

import '../../../model/audio_model.dart';
import '../../components/domain/home/home_audio_card.dart';
import '../../utils/route_utils.dart';

class MenuAudioPage extends StatelessWidget {
  const MenuAudioPage({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final List<Map<String, dynamic>> payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Detail Audio',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: payload
                .map(
                  (e) => HomeAudioCard(
                    model: AudioModel(
                      e['audio_url'],
                      e['srt'],
                      e['title'],
                      e['image'],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.listenBook,
                        arguments: AudioModel(
                          e['audio_url'],
                          e['srt'],
                          e['title'],
                          e['image'],
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
