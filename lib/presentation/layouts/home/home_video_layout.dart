import 'package:flutter/material.dart';
import 'package:pocket_books/presentation/components/domain/home/home_video_card.dart';

class HomeVideoLayout extends StatelessWidget {
  const HomeVideoLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            HomeVideoCard(),
            HomeVideoCard(),
            HomeVideoCard(),
            HomeVideoCard(),
            HomeVideoCard(),
          ],
        ),
      ),
    );
  }
}