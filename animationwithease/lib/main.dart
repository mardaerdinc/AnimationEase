import 'package:animationwithease/basic_animation_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(AnimationEase());

class AnimationEase extends StatelessWidget {
  const AnimationEase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "selam",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimationPage());
  }
}
