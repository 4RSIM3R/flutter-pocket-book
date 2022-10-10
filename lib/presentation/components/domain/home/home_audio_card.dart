import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/model/audio_model.dart';

import '../../../utils/route_utils.dart';

class HomeAudioCard extends StatelessWidget {
  const HomeAudioCard({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);

  final AudioModel model;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    model.thumbnailUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.title,
                    style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                    softWrap: false,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'English Lecture Team State Polytechnic Malang',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
