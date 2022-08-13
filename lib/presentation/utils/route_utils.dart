import 'package:flutter/material.dart';
import 'package:pocket_books/model/video_model.dart';
import 'package:pocket_books/presentation/pages/book/detail_audio_page.dart';
import 'package:pocket_books/presentation/pages/book/detail_book_page.dart';
import 'package:pocket_books/presentation/pages/book/detail_video_page.dart';
import 'package:pocket_books/presentation/pages/book/listen_book_page.dart';
import 'package:pocket_books/presentation/pages/book/spell_checker_page.dart';
import 'package:pocket_books/presentation/pages/common/splash_page.dart';
import 'package:pocket_books/presentation/pages/home/home_page.dart';

typedef MapRoutes = Widget Function(Object? object);

class RouteNames {
  static const splash = '/';
  static const home = '/home';
  static const spellChecker = '/spell-checker';
  static const detailBook = '/detail-book';
  static const listenBook = '/listen-book';
  static const detailVideo = '/detail-video';

  static Map<String, MapRoutes> maRoutes = {
    splash: (object) => const SplashPage(),
    home: (object) => const HomePage(),
    spellChecker: (object) => const SpellCheckerPage(),
    detailBook: (object) {
      final url = (object as String?);
      return DetailBookPage(pdfUrl: url);
    },
    listenBook: (object) => const DetailAudioPage(),
    detailVideo: (object) {
      final model = (object as VideoModel?);
      return DetailVideoPage(model: model);
    },
  };
}

class RouteUtils {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => generateWidget(routeName: settings.name, arguments: settings.arguments),
    );
  }

  static Widget generateWidget({String? routeName, Object? arguments}) {
    debugPrint('Current Route : $routeName');
    return RouteNames.maRoutes[routeName] != null ? RouteNames.maRoutes[routeName]!(arguments) : const Scaffold();
  }
}
