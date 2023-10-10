final srtRegex = RegExp(
  r'((\d{2}):(\d{2}):(\d{2})\,(\d+)) +--> +((\d{2}):(\d{2}):(\d{2})\,(\d{3})).*[\r\n]+\s*((?:(?!\r?\n\r?).)*(\r\n|\r|\n)(?:.*))',
  caseSensitive: false,
  multiLine: true,
);

const exampleSound = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';

const lorem =
    'Bangga menjadi bagian dari Politeknik Negeri Malang kita terbentuk didalamnya dengan bimbingan para dosen ahli dan sangat humble kepada mahasiswanya, kali ini SMC Studio berkesempatan untuk mengerjakan Profil Jurusan Teknologi Informasi yang merupakan Jurusan Terbaru dan paling banyak diminati karena di era digital ini banyak lapangan kerja yang membutuhkan tenaga di bidang IT ini.';

final listBook = [
  {
    "title": "Business Meeting",
    "url": "https://api.kontenbase.com/upload/file/628cf4cbdb20c52857fb0b75/jVHCcPtB/WKChnMQe/Topic%201.pdf",
    "author": "Business Meeting Course Team",
  },
  {
    "title": "Telephoning",
    "url": "https://api.kontenbase.com/upload/file/628cf4cbdb20c52857fb0b75/jVHCcPtB/AXgNDgOw/Topic%202.pdf",
    "author": "Business Meeting Course Team",
  },
  {
    "title": "Setting Up Business 1",
    "url": "https://api.kontenbase.com/upload/file/628cf4cbdb20c52857fb0b75/jVHCcPtB/RYRQHpDP/Topic%203.pdf",
    "author": "Business Meeting Course Team",
  },
  {
    "title": "Setting Up Business 2",
    "url": "https://api.kontenbase.com/upload/file/628cf4cbdb20c52857fb0b75/jVHCcPtB/aIXTEJcK/Topic%204.pdf",
    "author": "Business Meeting Course Team",
  }
];

final audios = {
  "Great Idioms Expressions for Negotiations": [
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-1.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-1.srt",
      "title": "Part 1",
      "image": "https://www.incimages.com/uploaded_files/image/1920x1080/shutterstock_645246526_351270.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-2.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-2.srt",
      "title": "Part 2",
      "image": "https://www.incimages.com/uploaded_files/image/1920x1080/shutterstock_645246526_351270.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-3.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-3.srt",
      "title": "Part 3",
      "image": "https://www.incimages.com/uploaded_files/image/1920x1080/shutterstock_645246526_351270.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-4.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-4.srt",
      "title": "Part 4",
      "image": "https://www.incimages.com/uploaded_files/image/1920x1080/shutterstock_645246526_351270.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-5.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/GreatIdiomsExpressionsForNegotiations-5.srt",
      "title": "Part 5",
      "image": "https://www.incimages.com/uploaded_files/image/1920x1080/shutterstock_645246526_351270.jpg",
    },
  ],
  "How To Be More Diplomatic & Polite": [
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-1-fix.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-1-fix.srt",
      "title": "Part 1",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-2-fix.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-2-fix.srt",
      "title": "Part 2",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-3-fix.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-3-fix.srt",
      "title": "Part 3",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-4-fix.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-4-fix.srt",
      "title": "Part 4",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-5-fix.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-5-fix.srt",
      "title": "Part 5",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-6-fix.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/HowToBeMoreDiplomaticPolite-6-fix.srt",
      "title": "Part 6",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
  ],
  "Phrases For Leading a Business Meeting": [
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a1.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a1.srt",
      "title": "Part 1",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a2.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a2.srt",
      "title": "Part 2",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a3.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a3.srt",
      "title": "Part 3",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a4.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a4.srt",
      "title": "Part 4",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a5.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a5.srt",
      "title": "Part 5",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a6.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a6.srt",
      "title": "Part 6",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a7.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a7.srt",
      "title": "Part 7",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a8.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a8.srt",
      "title": "Part 8",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a10.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a10.srt",
      "title": "Part 10",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a11.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a11.srt",
      "title": "Part 11",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a12.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f5a12.srt",
      "title": "Part 12",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
  ],
  "Must-Have English Phrases for Online Meetings": [
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a1.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a1.srt",
      "title": "Part 1",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a2.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a2.srt",
      "title": "Part 2",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a3.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a3.srt",
      "title": "Part 3",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a4.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a4.srt",
      "title": "Part 4",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a5.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a5.srt",
      "title": "Part 5",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
    {
      "audio_url": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a6.mp3",
      "srt": "https://is3.cloudhost.id/beceran-dev-nti/coba/f6a6.srt",
      "title": "Part 6",
      "image": "https://img.freepik.com/free-vector/group-therapy-illustration_74855-5516.jpg",
    },
  ],
};

const about = """
The digital pocketbook 1.0.0 is a collaboration work of Politenik Negeri Malang faculty members of the Accounting Department and Information Technology Department, as book writers, with students of the Information Technology Department as developers. With years of service, training, research, and experience in the teaching and learning of ESP at the tertiary level, materials development, and translations as faculty members and also as highly trained students of IT, the developed application can eventually assist students in excelling their language skills in a more meaningful, autonomous and fun way. The practices given encourages awareness of sustainable development, critical thinking and also character building.

Does anyone have any questions?
Follow the project updates

Lia Agustina, Farida Ulfa, et.al.
+62 812-5272-5262
lia_alfan2d@yahoo.com
  """;
