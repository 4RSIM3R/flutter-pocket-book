enum ParseState { number, time, text, empty }

class ParseSRTRepository {
  final payload = """
    1
    00:00:00,000 --> 00:00:01,564
    The next level application

    2
    00:00:02,663 --> 00:00:04,393
    A bunch of words
  """;

  
  List<Map<String, dynamic>> parse() {
    final splitted = payload.replaceAll('', '').split('\n').map((e) => e.trim()).toList();
    
    ParseState currentState = ParseState.number;
    int currentDuration = 0;
    String currentText = "";

    final List<Map<String, dynamic>> parsedList = [];

    for (var split in splitted) {
      if (currentState == ParseState.number || currentState == ParseState.number) {
        currentState = ParseState.time;
      } else if (currentState == ParseState.time) {
        final timeSplit = split.trim().split('-->').map((e) => e.trim()).toList();

        final firstMiliSecond = int.parse(timeSplit[0].split(',').last);
        final firstSecond = int.parse(timeSplit[0].split(',').first.split(':').last);
        final firstDuration = Duration(seconds: firstSecond, milliseconds: firstMiliSecond).inMilliseconds;

        final secondMilisecond = int.parse(timeSplit[1].split(',').last);
        final secondSecond = int.parse(timeSplit[1].split(',').first.split(':').last);
        final secondDuration = Duration(seconds: secondSecond, milliseconds: secondMilisecond).inMilliseconds;

        final duration = secondDuration - firstDuration;
        currentDuration = duration;

        currentState = ParseState.text;
      } else {
        if (split.isNotEmpty) {
          currentText = split;
          parsedList.add({
            "text" : currentText,
            "duration" : currentDuration,
          });
          currentState = ParseState.empty;
        } else {
          currentState = ParseState.number;
        }
      }
    }

    return parsedList;
  }
}
