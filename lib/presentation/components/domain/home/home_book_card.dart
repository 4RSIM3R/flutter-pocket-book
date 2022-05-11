import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

class HomeBookCard extends StatelessWidget {
  const HomeBookCard({Key? key, this.title, this.author}) : super(key: key);

  final String? title;
  final String? author;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.detailBook);
      },
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 65,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: CachedNetworkImageProvider(
                    'https://imgv2-2-f.scribdassets.com/img/word_document/332828142/original/216x287/2855e2ff9d/1617230868?v=1',
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
                    style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                    softWrap: false,
                  ),
                  Text(
                    author ?? '',
                    style: TextStyle(color: Colors.grey[500]),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            PopupMenuButton(
              itemBuilder: (_) => const <PopupMenuItem<String>>[
                PopupMenuItem<String>(child: Text('Read'), value: 'Read'),
                PopupMenuItem<String>(child: Text('Download'), value: 'Download'),
              ],
              child: const Icon(Icons.more_vert),
              onSelected: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
