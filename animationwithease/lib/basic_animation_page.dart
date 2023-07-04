import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeInOut);
// animation = Tween<double>(begin: 0, end: 2 * math.pi)
//         .chain(CurveTween(curve: Curves.bounceIn))
//         .animate(animController) this code is also usefull but if you want to use this you should make comment line 23-26
    animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });
    animController.forward(); //it makes 0 to 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animation.value, //it makes logo rotate
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Image.asset('assets/wplogo.png'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
