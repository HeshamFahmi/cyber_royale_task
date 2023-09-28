// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppColors {
  static const mainColor = Color(0xff00065C);
  static const darkGreyColor = Color(0xff214440);
  static const bubblesColor = Color(0xff0F2183);
  static const secondBubbleColor = Color(0xff28BBD8);
  static const greenColor = Color(0xff03A770);
  static const redColor = Color(0xffFF4040);
  static const whiteBoxColor = Color(0xffFFFFFF);
  static const greenBoxColor = Color(0xff02C830);
  static const yellowBoxColor = Color(0xffE09500);

  static const LinearGradient backGroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.mainColor, AppColors.darkGreyColor]);
}
