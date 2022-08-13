import 'package:flutter/material.dart';
import 'package:pocket_books/model/video_model.dart';
import 'package:pocket_books/presentation/components/domain/home/home_video_card.dart';

class HomeVideoLayout extends StatelessWidget {
  const HomeVideoLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            HomeVideoCard(
              model: VideoModel(
                'https://www.youtube.com/watch?v=Wb6Oc1_SdJw',
                'This video is aimed at developing your listening skills, understanding and using useful phrases for smart meeting participation. Especially if you have to participate in real business meetings but you are not very experienced and therefore not confident enough.',
                'https://docs.google.com/forms/d/e/1FAIpQLSeFzXGtH_j2qVw1uBI6Ow8mcYKXjfNvTsEVnrU6ScwW9EF7bQ/viewform',
                'Business English B1 - B2: Participating in meetings 1',
              ),
            ),
            HomeVideoCard(
              model: VideoModel(
                'https://www.youtube.com/watch?v=2fA836LFytg',
                'The video where Paul, the HR Manager at Quartz Power Group, called a meeting to discuss a new training program.',
                'https://docs.google.com/forms/d/13SnnVRVoLxdjcdH6m2drlA5KDGLNmP3gkuVZqz0FGbc/viewform',
                'Business English: Participating in meetings 2',
              ),
            ),
            HomeVideoCard(
              model: VideoModel(
                'https://www.youtube.com/watch?v=8hrPkzR0_6Q',
                'This video offers the most common expressions and idioms used in negotiations. Practise your speaking skills and become more confident by repeating the examples with me.',
                'https://docs.google.com/forms/d/e/1FAIpQLSdg-nE8HUuEcmlK6gEToqnAhpYlsI-8fWOlP_6YZZJI4-xMRQ/viewform',
                '10 Great Idioms & Expressions for Negotiations - Business English',
              ),
            ),
            HomeVideoCard(
              model: VideoModel(
                'https://www.youtube.com/watch?v=41JMWuGLDzk',
                'Negotiation can be a tough cookie. There are times when we need to be direct in business, but there are also times when we need to be more diplomatic and polite. Soften what you are going to say, making it less direct is a great way to be more diplomatic. Listen and show understanding is also a great way to make you sound more diplomatic. ',
                '',
                'How To Be More Diplomatic & Polite - Business English',
              ),
            ),
            HomeVideoCard(
              model: VideoModel(
                'https://www.youtube.com/watch?v=gMsOw2urOQU',
                'This is an example of a student made video for completing English Course assignment. ',
                '',
                'Role Play Business Meeting 1',
              ),
            ),
            HomeVideoCard(
              model: VideoModel(
                'https://www.youtube.com/watch?v=cdq6onYgtSg',
                'This video offers 41 of the most common English phrases for leading a business meeting in this short video. You will gain the opportunity to improve your skill in managing the discussion, delegating tasks, outlining the agenda and much more.',
                '',
                '41 Phrases For Leading A Business Meeting - Business English',
              ),
            ),
            HomeVideoCard(
              model: VideoModel(
                'https://www.youtube.com/watch?v=LltiR8lbifM',
                'To help you gain confidence in leading a Zoom meeting, joining an online English conversation group or an online book club is what this video will assist you. Not only will you gain a stronger understanding of Zoom etiquette but you will also get essential English for online meetings including minimizing technical issues, handling interruptions, and taking control of any situation successfully.',
                '',
                'Must-Have English Phrases for Online Meetings [Professional English Skills]',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
