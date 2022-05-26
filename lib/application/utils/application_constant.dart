final srtRegex = RegExp(
  r'((\d{2}):(\d{2}):(\d{2})\,(\d+)) +--> +((\d{2}):(\d{2}):(\d{2})\,(\d{3})).*[\r\n]+\s*((?:(?!\r?\n\r?).)*(\r\n|\r|\n)(?:.*))',
  caseSensitive: false,
  multiLine: true,
);

final exampleSound = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';