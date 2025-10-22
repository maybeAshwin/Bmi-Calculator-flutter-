import 'package:bmicalculator/result_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

 final String buttonName;
 final VoidCallback onClick;
 BottomButton({required this.buttonName,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColor,
      height: kBottomContainerHeight,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      child: TextButton(
        onPressed: onClick,
        child: Text(
          buttonName,
          style: kTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  RoundIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0XFF1D2134),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}