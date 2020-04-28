import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Rotator extends StatefulWidget {
  @override
  _RotatorState createState() => _RotatorState();
}

class _RotatorState extends State<Rotator> with TickerProviderStateMixin {
  AnimationController controller;
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, duration: const Duration(seconds: 10000));
      print("$controller.value");
    controller.forward();
    
  }
  @override
void dispose() {
  controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
          child: RotatingGear(
        controller: controller,
      )),
    );
  }
}

class RotatingGear extends AnimatedWidget {
  RotatingGear({AnimationController controller})
      : super(
            listenable: Tween<double>(begin: 0, end: 15000).animate(controller));
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Transform.rotate(
      angle: animation.value,
      child: Container(
        height: 200,
        width: 200,
        child: SvgPicture.asset('images/Gear.svg'),
      ),
    );
  }
}