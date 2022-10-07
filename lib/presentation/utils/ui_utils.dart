import 'package:flutter/widgets.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

typedef FutureVoidForHomeScreen = Future<void> Function(BuildContext context);

const popUpMenuHomeScreen = ['Spell Checker', 'Profile', 'Logout'];

Map<String, FutureVoidForHomeScreen> mapHomeScreenMenu = {
  'Spell Checker': (context) async {
    Navigator.pushNamed(context, RouteNames.spellChecker);
  },
};

const lorem =
    'Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an';
