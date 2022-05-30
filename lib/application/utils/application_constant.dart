final srtRegex = RegExp(
  r'((\d{2}):(\d{2}):(\d{2})\,(\d+)) +--> +((\d{2}):(\d{2}):(\d{2})\,(\d{3})).*[\r\n]+\s*((?:(?!\r?\n\r?).)*(\r\n|\r|\n)(?:.*))',
  caseSensitive: false,
  multiLine: true,
);

final exampleSound = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';

final lorem = 'Bangga menjadi bagian dari Politeknik Negeri Malang kita terbentuk didalamnya dengan bimbingan para dosen ahli dan sangat humble kepada mahasiswanya, kali ini SMC Studio berkesempatan untuk mengerjakan Profil Jurusan Teknologi Informasi yang merupakan Jurusan Terbaru dan paling banyak diminati karena di era digital ini banyak lapangan kerja yang membutuhkan tenaga di bidang IT ini.';