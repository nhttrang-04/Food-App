import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'dart:math';

import 'circle_painter.dart';

class AppStartup extends StatefulWidget {
  const AppStartup({super.key});

  @override
  State<AppStartup> createState() => _AppStartup();
}

class _AppStartup extends State<AppStartup> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
    Timer(const Duration(seconds: 2), () {
      GoRouter.of(context).go('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Top Left Circle
          Positioned(
            top: -150,
            left: -170,
            child: SizedBox(
              width: 350,
              height: 350,
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: CustomPaint(
                  size: const Size(50, 50),
                  painter: CirclePainter(
                    color: const Color.fromARGB(128, 128, 128, 128)
                  ),
                ),
              ),
            ),
          ),
          
          // Bottom Right Circle
          Positioned(
            bottom: -170,
            right: -200,
            child: SizedBox(
              width: 400,
              height: 400,
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0, 
                duration: const Duration(milliseconds: 500),
                child: Transform.rotate(
                  angle: pi,
                  child: CustomPaint(
                    size: const Size(50, 50),
                    painter: CirclePainter(
                      color: const Color.fromARGB(255, 255, 128, 0)
                    ),
                  ),
                )
              ),
            )
          ),
          // Food Logo - Centered
          Center(
            child: SvgPicture.asset(
              'lib/src/presentation/core/widgets/app_startup/picture/logo.svg',
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}