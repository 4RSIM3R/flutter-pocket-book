import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/model/book_model.dart';
import 'package:pocket_books/model/book_props.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

class HomeBookLayout extends StatefulWidget {
  const HomeBookLayout({Key? key}) : super(key: key);

  @override
  State<HomeBookLayout> createState() => _HomeBookLayoutState();
}

class _HomeBookLayoutState extends State<HomeBookLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.listBook,
                arguments: BookProps(
                  title: 'Book 1',
                  description:
                      'This digital pocket guide aims to enhance the classroom textbook experience by offering topic summaries, supplementary materials, mini practice sessions, and WebQuest challenges related to business meetings.',
                  books: bookOne,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Icon(CupertinoIcons.folder, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book 1',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Short Description Here',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.listBook,
                arguments: BookProps(
                  title: 'Book 2',
                  description:
                      'The second book is specifically designed for English for Business topics, aiming to help students apply their computer knowledge effectively, enhance language skills in a natural and authentic context, and foster students independence, tolerance, creativity, professionalism, knowledge, and insight.',
                  books: bookTwo,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Icon(CupertinoIcons.folder, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book 2',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Short Description Here',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
