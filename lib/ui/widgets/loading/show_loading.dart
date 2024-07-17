import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShowLoading extends StatelessWidget {
  const ShowLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
                // color: Colors.transparent,
              ),
            ),
          ),
          Lottie.asset(
            "assets/animations/loading.json",
            fit: BoxFit.fill,
            width: 350,
            height: 350,
            frameRate: const FrameRate(120),
          ),
        ],
      ),
    );
  }
}
