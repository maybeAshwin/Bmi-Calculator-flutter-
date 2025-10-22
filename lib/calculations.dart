import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Calculations {
  final int height;
  final int weight;
  late final double _bmi;

  Calculations({
    required this.weight,
    required this.height,
  });

  String calculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVER WEIGHT';

    } else if (_bmi <= 18.5) {
      return 'UNDER WEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  Color getResultColor() {
    if (_bmi >= 25) {
      return Colors.yellow;

    } else if (_bmi <= 18.5) {
      return Colors.blue;
    } else {
      return Color(0xFF39CC8B);
    }
  }

  String getInterP() {
    if (_bmi >= 25) {
      return ' YOU HAVE A HIGHER WEIGHT DO SOME CARDIO';
    } else if (_bmi <= 18.5) {
      return 'EAT SOME GOOD SHIT';
    } else {
      return 'YOU ARE PERFECT ';
    }
  }
}
