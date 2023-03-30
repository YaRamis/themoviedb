import 'package:flutter/material.dart';

abstract class AppBoxDecoration {
  static final errorBoxDecoration = BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          spreadRadius: 0.01,
          blurRadius: 5,
        )
      ]);
}
