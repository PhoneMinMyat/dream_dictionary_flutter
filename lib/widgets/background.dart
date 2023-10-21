import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
            child: RiveAnimation.asset(
          'assets/solar.riv',
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
          child: const SizedBox(),
        ))
      ],
    );
  }
}
