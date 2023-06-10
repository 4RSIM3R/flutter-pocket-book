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
    "author": "English Lecture Team State Polytechnic Malang",
  },
  {
    "title": "Telephoning",
    "url": "https://api.kontenbase.com/upload/file/628cf4cbdb20c52857fb0b75/jVHCcPtB/AXgNDgOw/Topic%202.pdf",
    "author": "English Lecture Team State Polytechnic Malang",
  },
  {
    "title": "Setting Up Business 1",
    "url": "https://api.kontenbase.com/upload/file/628cf4cbdb20c52857fb0b75/jVHCcPtB/RYRQHpDP/Topic%203.pdf",
    "author": "English Lecture Team State Polytechnic Malang",
  },
  {
    "title": "Setting Up Business 2",
    "url": "https://api.kontenbase.com/upload/file/628cf4cbdb20c52857fb0b75/jVHCcPtB/aIXTEJcK/Topic%204.pdf",
    "author": "English Lecture Team State Polytechnic Malang",
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

const about =
    "This digital pocket book is developed for the purpose of completing research in developing a digital pocket book for businessmeeting purpose. Both book and the application have been validated to meet the criteria of exxelence for students and also teacher use. The writers of the book are faculty members of Politeknik Negeri Malang with years of service, trainings, research and experiences in the teaching and learning of ESP in tertiary level, also in materials development and translations";
