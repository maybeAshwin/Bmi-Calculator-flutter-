import 'package:flutter/material.dart';
import 'constants.dart';

class IconDetails extends StatelessWidget {
  final IconData icon;
  final String label;

  IconDetails({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 90.0),
        SizedBox(height: 15.0),
        Text(
          label,
          style: kTextStyle,
        ),
      ],
    );
  }
}