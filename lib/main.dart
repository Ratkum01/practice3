import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:koko3_ratkum/page1.dart';
import 'package:koko3_ratkum/page2.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List pagess = [Page1(), Page2()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: CarouselSlider.builder(
        slideTransform: CubeTransform(), // чтоб переход был кубическим
        slideIndicator: CircularSlideIndicator(
            padding: EdgeInsets.only(bottom: 50)), // точки внизу
        unlimitedMode: true,
        itemCount: pagess.length,
        slideBuilder: (int index) {
          return Container(
            child: pagess[index],
          );
        },
      ),
    );
  }
}
