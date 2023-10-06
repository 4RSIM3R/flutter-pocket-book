import 'package:flutter/material.dart';
import 'package:pocket_books/model/audio_model.dart';
import 'package:pocket_books/model/book_props.dart';
import 'package:pocket_books/model/video_model.dart';
import 'package:pocket_books/presentation/pages/audio/detail_audio_page.dart';
import 'package:pocket_books/presentation/pages/audio/menu_audio_page.dart';
import 'package:pocket_books/presentation/pages/book/detail_book_page.dart';
import 'package:pocket_books/presentation/pages/book/list_book_page.dart';
import 'package:pocket_books/presentation/pages/common/onboarding_page.dart';
import 'package:pocket_books/presentation/pages/common/splash_page.dart';
import 'package:pocket_books/presentation/pages/home/home_page.dart';
import 'package:pocket_books/presentation/pages/spell/spell_checker_page.dart';
import 'package:pocket_books/presentation/pages/videos/detail_video_page.dart';

import '../pages/common/about_us_page.dart';

typedef MapRoutes = Widget Function(Object? object);

class RouteNames {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const spellChecker = '/spell-checker';
  static const listBook = '/list-book';
  static const detailBook = '/detail-book';
  static const listenBook = '/listen-book';
  static const detailVideo = '/detail-video';
  static const aboutUs = '/about-us';
  static const menuAudio = '/menu-audio';

  static Map<String, MapRoutes> maRoutes = {
    splash: (object) => const SplashPage(),
    onboarding: (object) => const OnboardingPage(),
    home: (object) => const HomePage(),
    spellChecker: (object) => const SpellCheckerPage(),
    detailBook: (object) {
      final url = (object as String?);
      return DetailBookPage(pdfUrl: url);
    },
    listenBook: (object) {
      final model = (object as AudioModel);
      return DetailAudioPage(model: model);
    },
    detailVideo: (object) {
      final model = (object as VideoModel?);
      return DetailVideoPage(model: model);
    },
    aboutUs: (args) => const AboutUsPage(),
    menuAudio: (args) => MenuAudioPage(payload: (args as List<Map<String, dynamic>>?) ?? []),
    listBook: (args) => ListBookPage(props: args as BookProps),
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
