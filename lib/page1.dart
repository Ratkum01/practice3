import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //create variable
  double _currentvalue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'S L I D E R',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[500],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '$_currentvalue',
          style: TextStyle(fontSize: 40),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Slider(
              activeColor: Colors.black,
              inactiveColor: Colors.grey[500],
              thumbColor: Color.fromARGB(255, 255, 0, 0),
              divisions: 10, // сколько будет делении
              min: 0,
              max: 10,
              label: _currentvalue.toString(),
              value: _currentvalue,
              onChanged: (value) {
                setState(() {
                  _currentvalue = value;
                });
              }),
        )
      ]),
    );
  }
}
