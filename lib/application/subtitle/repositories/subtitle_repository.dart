import 'package:dio/dio.dart';
import 'package:pocket_books/application/subtitle/model/subtitle_model.dart';
import 'package:pocket_books/application/utils/application_constant.dart';

class SubtitleRepository {
  Dio? dio;

  SubtitleRepository() {
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 60 * 1000),
      sendTimeout: const Duration(milliseconds: 60 * 1000),
      receiveTimeout: const Duration(milliseconds: 60 * 1000),
    ));
  }

  Future<String?> loadRemoteSrt({String? url}) async {
    final response = await dio!.get(url!);

    return response.data.toString();
  }

  Future<List<SubtitleModels>> parseSrt({String? url}) async {
    List<SubtitleModels> models = [];

    final content = await loadRemoteSrt(url: url);

    final matches = srtRegex.allMatches(content!).toList();

    for (var match in matches) {
      final startTimeHours = int.parse(match.group(2)!);
      final startTimeMinutes = int.parse(match.group(3)!);
      final startTimeSeconds = int.parse(match.group(4)!);
      final startTimeMilliseconds = int.parse(match.group(5)!);

      final endTimeHours = int.parse(match.group(7)!);
      final endTimeMinutes = int.parse(match.group(8)!);
      final endTimeSeconds = int.parse(match.group(9)!);
      final endTimeMilliseconds = int.parse(match.group(10)!);
      final text = match.group(11)!;

      final startTime = Duration(
        hours: startTimeHours,
        minutes: startTimeMinutes,
        seconds: startTimeSeconds,
        milliseconds: startTimeMilliseconds,
      );
      final endTime = Duration(
        hours: endTimeHours,
        minutes: endTimeMinutes,
        seconds: endTimeSeconds,
        milliseconds: endTimeMilliseconds,
      );

      models.add(
        SubtitleModels(startTime: startTime, endTime: endTime, text: text.trim()),
      );
    }

    return models;
  }
}
