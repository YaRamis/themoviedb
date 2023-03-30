import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const linkButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const defaultButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  static const defaultBlackTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static const defaultWhiteTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static const inputGreetTextStyle = TextStyle(
    fontSize: 16,
    color: Color(0xFF212529),
  );

  static const errorTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );
}
