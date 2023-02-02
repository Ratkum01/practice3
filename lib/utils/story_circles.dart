import 'package:flutter/material.dart';

class Storys extends StatelessWidget {
  final function;
  const Storys({super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[500],
          ),
          height: 70,
          width: 70,
        ),
      ),
    );
  }
}
