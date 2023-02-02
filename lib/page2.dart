import 'package:flutter/material.dart';
import 'package:koko3_ratkum/story_page.dart';
import 'package:koko3_ratkum/utils/story_circles.dart';
import 'package:lottie/lottie.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  //для анимации
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool bookmarked = false;

  //для сториса

  void _openStory() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoryPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'S T O R Y S',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[500],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Storys(
                    function: _openStory,
                  );
                }),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            width: 350,
            child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_mDnmhAgZkb.json'),
          ),
        ),
        SizedBox(height: 100,)
        // Center(
        //   child: GestureDetector(
        //     onTap: () {
        //       //анимаиця двигается вперед
        //       if (bookmarked = false) {
        //         bookmarked = true;
        //         _controller.forward();
        //       }
        //       // анимация назад
        //       else {
        //         bookmarked = false;
        //         _controller.reverse();
        //       }
        //     },
        //     child: Lottie.network(
        //         'https://assets7.lottiefiles.com/packages/lf20_JlLXqc.json',
        //         controller: _controller),
        //   ),
        // )
      ]),
    );
  }
}
