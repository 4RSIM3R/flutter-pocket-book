import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pocket_books/presentation/components/domain/home/home_book_card.dart';
import 'package:pocket_books/presentation/layouts/home/home_audio_layout.dart';
import 'package:pocket_books/presentation/layouts/home/home_book_layout.dart';
import 'package:pocket_books/presentation/layouts/home/home_video_layout.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

import '../../utils/ui_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  final layouts = [
    HomeBookLayout(),
    HomeAudioLayout(),
    HomeVideoLayout(),
  ];

  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // askPermission();
  }

  // Future<void> askPermission() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.microphone,
  //     Permission.bluetooth,
  //   ].request();
  //   if (kDebugMode) {
  //     print(statuses[Permission.microphone]);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.aboutUs);
                  },
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.info_circle),
                      SizedBox(width: 12),
                      Text(
                        'About Us',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.black),
        ),
        title: Text(
          'Pocket Book',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: layouts[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
          BottomNavigationBarItem(icon: Icon(Icons.audiotrack_rounded), label: 'Audio'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library_rounded), label: 'Video'),
        ],
      ),
    );
  }
}
