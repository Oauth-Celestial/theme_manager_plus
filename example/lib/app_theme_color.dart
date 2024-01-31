import 'package:example/theme_model.dart';
import 'package:flutter/material.dart';

// const color = const Color(0xFFB74093);

AppTheme lightTheme = AppTheme(
  backgroundColor: Colors.white,
  heading: TextStyle(color: Colors.black, fontSize: 16),
  subheading: TextStyle(color: Colors.black, fontSize: 14),
);

AppTheme Darktheme = AppTheme(
  backgroundColor: Colors.black,
  heading: TextStyle(color: Colors.white, fontSize: 16),
  subheading: TextStyle(color: Colors.white, fontSize: 14),
);
