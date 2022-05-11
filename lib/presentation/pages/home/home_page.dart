import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pocket_books/presentation/components/domain/home/home_book_card.dart';
import 'package:pocket_books/presentation/layouts/home/home_audio_layout.dart';
import 'package:pocket_books/presentation/layouts/home/home_book_layout.dart';

import '../../utils/ui_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    askPermission();
  }

  Future<void> askPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.bluetooth,
    ].request();
    if (kDebugMode) {
      print(statuses[Permission.microphone]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(4),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Pocket Books',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              PopupMenuButton(
                child: const Icon(Icons.more_vert),
                onSelected: (String value) => mapHomeScreenMenu[value]!(context),
                itemBuilder: (BuildContext context) {
                  return popUpMenuHomeScreen.map(
                    (String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    },
                  ).toList();
                },
              )
            ],
            bottom: const TabBar(
              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              unselectedLabelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              labelColor: Colors.black,
              padding: EdgeInsets.zero,
              tabs: [
                Tab(child: Text('Books')),
                Tab(child: Text('Audio')),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: const TabBarView(
            children: [
              HomeBookLayout(),
              HomeAudioLayout(),
            ],
          ),
        ),
      ),
    );
  }
}
