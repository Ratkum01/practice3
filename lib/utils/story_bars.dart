import 'package:flutter/material.dart';
import 'package:koko3_ratkum/utils/progress_bar.dart';

class MyStoryBars extends StatelessWidget {
   MyStoryBars({super.key , required this.procentWatch});
List<double> procentWatch = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 8, right: 8),
      child: Row(
        children: [
          Expanded(child: MyProgressBar(percentWatched: procentWatch[0])),
          Expanded(child: MyProgressBar(percentWatched: procentWatch[1])),
          Expanded(child: MyProgressBar(percentWatched: procentWatch[2]))
        ],
      ),
    );
  }
}
