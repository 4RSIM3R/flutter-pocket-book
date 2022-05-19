import 'package:flutter/material.dart';

import '../../components/domain/home/home_book_card.dart';

class HomeBookLayout extends StatelessWidget {
  const HomeBookLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: const [
            HomeBookCard(title: 'Microservices Up And Running', author: 'Abah Haji Martin Fowler'),
            HomeBookCard(title: 'Production Ready Laravel', author: 'Gus Taylor Otwell'),
            HomeBookCard(title: 'Flutter, Behind The Scene', author: 'Raden Eric Seidel'),
            HomeBookCard(title: 'Al-asas fil SQLite', author: 'Syech Dwayne Richard Hipp'),
            HomeBookCard(title: 'Majmu fil bayani open source', author: 'Syech Richard Stallman'),
            HomeBookCard(title: 'Tahafuti Al Microservice-iyah', author: 'Netflix Group'),
            HomeBookCard(title: 'Amsilati Al-agile-iyah', author: 'Hujjatul-startup Jeff Sutherland'),
          ],
        ),
      ),
    );
  }
}
