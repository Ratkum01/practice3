import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:koko3_ratkum/stories/my_story1.dart';
import 'package:koko3_ratkum/stories/my_story2.dart';
import 'package:koko3_ratkum/stories/my_story3.dart';
import 'package:koko3_ratkum/utils/progress_bar.dart';
import 'package:koko3_ratkum/utils/story_bars.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List myStories = [MyStory1(), MyStory2(), MyStory3()];
  List<double> procentWatch = [];
  @override
  void initState() {
    // stroise peredvijenie
    super.initState();
    for (int i = 0; i < myStories.length; i++) {
      procentWatch.add(0);
    }
    _startWatching();
  }

  //start Storis and perekluchenie
  void _startWatching() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        //only add 0.01 as long it's below 1
        if (procentWatch[currentStoryIndex] + 0.01 < 1) {
          procentWatch[currentStoryIndex] += 0.01;
        }
        //if adding 0.01 exceeds 1, 5 set percentage to 1 and cancel timer
        else {
          procentWatch[currentStoryIndex] = 1;
          timer.cancel();
          // also go to next story as long as there are more stories to go through
          if (currentStoryIndex < myStories.length - 1) {
            currentStoryIndex++;
            //restart story timer
            _startWatching();
          }
          // if we are finishing  the last story then return to homepage
          else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    //user taps in first half of screen;
    if (dx < screenWidth / 2) {
      setState(() {
        if (currentStoryIndex > 0) {
          //set previous and curent story watched percentage back to 0
          procentWatch[currentStoryIndex - 1] = 0;
          procentWatch[currentStoryIndex] = 0;
          //go to previos story
          currentStoryIndex--;
        }
      });
    }
    //user taps on second half of screen
    else {
      setState(() {
        //if there are more stories left
        if (currentStoryIndex < myStories.length - 1) {
          procentWatch[currentStoryIndex] = 1;
          currentStoryIndex++;
        }
        //if user is on the last story, finish this story
        else{
          procentWatch[currentStoryIndex]= 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            myStories[currentStoryIndex],
            MyStoryBars(
              procentWatch: procentWatch,
            ),
          ],
        ),
      ),
    );
  }
}
