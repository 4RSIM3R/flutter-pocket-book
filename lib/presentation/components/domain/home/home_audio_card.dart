import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/route_utils.dart';

class HomeAudioCard extends StatelessWidget {
  const HomeAudioCard({
    Key? key,
    this.title,
    this.author,
    this.image,
  }) : super(key: key);

  final String? title;
  final String? author;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.listenBook);
      },
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
                    image!,
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
                    title ?? '',
                    style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                    softWrap: false,
                  ),
                  SizedBox(height: 4),
                  Text(
                    author ?? '',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ],
              ),
            ),
            // const SizedBox(width: 8),
            // PopupMenuButton(
            //   itemBuilder: (_) => const <PopupMenuItem<String>>[
            //     PopupMenuItem<String>(child: Text('Read'), value: 'Read'),
            //     PopupMenuItem<String>(child: Text('Download'), value: 'Download'),
            //   ],
            //   child: const Icon(Icons.more_vert),
            //   onSelected: (value) {},
            // )
          ],
        ),
      ),
    );
  }
}
