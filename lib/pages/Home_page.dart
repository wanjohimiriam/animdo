// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double buttonRadius = 100;
  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);

  AnimationController? _starIconAnimationController;

  @override
  void initState() {
    super.initState();
    _starIconAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4)
        );
        _starIconAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(child: Text("Animations In flutter")),
      ),
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularButtonAnimation(),
                _straIcon()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      curve: Curves.easeInOutCubicEmphasized,
      duration: Duration(seconds: 1),
      builder: (_context, double _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Colors.blue,
      ),
    );
  }

  Widget _circularButtonAnimation() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            buttonRadius += buttonRadius == 200 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.bounceInOut,
          height: buttonRadius,
          width: buttonRadius,
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(buttonRadius)),
          child: Center(
            child: Text(
              'Basics',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
  Widget _straIcon(){
    return AnimatedBuilder(
      animation: _starIconAnimationController!.view,
      builder: (_context, _child){
        return Transform.rotate(
          angle: _starIconAnimationController!.value * 2 * 3.14,
          child: _child,
          );
      },
      child: Icon(Icons.star, 
      color: Colors.white,
      size: 100.0,),
    );
  }
}
