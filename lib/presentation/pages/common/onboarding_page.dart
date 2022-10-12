import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _images = [
    'assets/images/english.png',
    'assets/images/formula.png',
    'assets/images/webinar.png',
  ];

  final _title = [
    'Business Meeting',
    'New Things You Can Learn',
    'Enriching Your Knowledge',
  ];

  final _subtitle = [
    'Business Meeting Presentation in A Nutshell is built to assist you in getting the gist on how to do a Business Meeting.',
    'Go to the” WebQuest” and find out more about new things you can learn and help you gain more confident in practicing the oral communication skills for business meeting in real-life.',
    'All materials are well-thought and tailor made for enriching your knowledge.',
  ];

  final _controller = PageController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: _images.length,
                controller: _controller,
                onPageChanged: (val) {
                  setState(() {
                    _current = val;
                  });
                },
                itemBuilder: (context, i) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        _images[i],
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      _title[i],
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 12),
                    Text(
                      _subtitle[i],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    children: _images
                        .map((e) => AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: 15,
                              width: e == _images[_current] ? 45 : 15,
                              margin: EdgeInsets.only(
                                right: 8,
                              ),
                              decoration: BoxDecoration(
                                color: e == _images[_current] ? Colors.blue : Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () {
                      if (_current < _images.length - 1) {
                        _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                      } else {
                        Navigator.pushReplacementNamed(context, RouteNames.home);
                      }
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
