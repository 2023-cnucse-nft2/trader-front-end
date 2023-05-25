import 'package:flutter/material.dart';

class DesignKit {
  // colors
  static const Color deepGreen = Color.fromARGB(255, 3, 81, 40);
  static const Color featherDirtGreen = Color.fromARGB(255, 180, 188, 184);
  static const Color lightDirtGreen = Color.fromARGB(255, 97, 109, 103);
  static const Color lightDirtGreen70 = Color.fromARGB(179, 97, 109, 103);
  static const Color dirtGreen = Color.fromARGB(255, 29, 34, 31);
  static const Color heavyDirtGreen = Color.fromARGB(255, 29, 34, 31);
  static const Color featherGreen = Color.fromARGB(255, 245, 255, 250);
  static const Color lightGreen = Color.fromARGB(255, 240, 255, 247);
  static const Color tonalGreen = Color.fromARGB(255, 215, 248, 230);
  static const Color red = Color.fromARGB(255, 168, 32, 34);
  static const Color blue = Color.fromARGB(255, 16, 26, 121);
  // static const Color yellow = Color.fromARGB(255, 255, 215, 0);
  // static const Color gray = Color.fromARGB(255, 188, 188, 188);

  // proportions
  // figma에 있는 컴포넌트 사이즈를 넣으면 기기에 맞는 비율로 변환합니다.
  static double getWidth(BuildContext context, double width) =>
      MediaQuery.of(context).size.width * width / 390;
  static double getHeight(BuildContext context, double hegiht) =>
      MediaQuery.of(context).size.height * hegiht / 844;
  static double getFontSize(BuildContext context, double fontSize) =>
      MediaQuery.of(context).size.width * fontSize / 390;
}

class Bulkhead extends StatelessWidget {
  const Bulkhead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      margin: EdgeInsets.symmetric(vertical: 20),
      color: Color.fromARGB(255, 207, 207, 207),
    );
  }
}
