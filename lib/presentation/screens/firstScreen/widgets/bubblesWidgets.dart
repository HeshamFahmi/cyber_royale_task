// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../utils /appColors.dart';

class BubbleBackgroundStackWidget extends StatelessWidget {
  const BubbleBackgroundStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BubblesBackgroundWidget(
            left: -40,
            color: AppColors.bubblesColor.withOpacity(.75),
            height: 128,
            top: 292,
            width: 128),
        BubblesBackgroundWidget(
            left: 57,
            color: AppColors.bubblesColor.withOpacity(1.0),
            height: 109,
            top: -50,
            width: 109),
        BubblesBackgroundWidget(
            left: 312,
            top: 91,
            color: AppColors.secondBubbleColor.withOpacity(0.36),
            width: 138,
            height: 138),
        BubblesBackgroundWidget(
            left: 356,
            top: 336,
            color: AppColors.bubblesColor.withOpacity(0.75),
            width: 212,
            height: 212)
      ],
    );
  }
}

class BubblesBackgroundWidget extends StatelessWidget {
  final double left;
  final double top;
  final Color color;
  final double width;
  final double height;
  const BubblesBackgroundWidget({
    Key? key,
    required this.left,
    required this.top,
    required this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            color: color,
          ),
          width: width,
          height: height,
        ));
  }
}
