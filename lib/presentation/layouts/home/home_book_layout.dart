import 'package:flutter/material.dart';
import 'package:pocket_books/application/utils/application_constant.dart';

import '../../components/domain/home/home_book_card.dart';

class HomeBookLayout extends StatefulWidget {
  const HomeBookLayout({Key? key}) : super(key: key);

  @override
  State<HomeBookLayout> createState() => _HomeBookLayoutState();
}

class _HomeBookLayoutState extends State<HomeBookLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: listBook
              .map(
                (e) => HomeBookCard(
                  author: e['author'],
                  title: e['title'],
                  pdfUrl: e['url'],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
