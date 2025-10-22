import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'extracted_buttons.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiResults,required this.bmiResultValue,required this.interP,required this.colors});

  final String bmiResults;
  final String bmiResultValue;
  final String interP;
  final Color colors;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(child: Text('BMI CALCULATOR'))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULT',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReusableCard(
                  colour: kInactiveContainerColor,
                  cardChild: Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment:
                          CrossAxisAlignment.center,
                      children: [
                        Text(bmiResults, style: kNormalTextStyle.copyWith( color:colors)),
                        Text(bmiResultValue, style: kLargeTextStyle),
                        Center(
                          child: Text(
                            'Healthy BMI Range:\n 18.5-25 kg/m2',
                            style: kTextStyle,
                          ),
                        ),
                        Text(interP, style: kTextStyle),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            BottomButton(buttonName: 'RE-CALCULATE YOUR BMI',onClick: (){Navigator.of(context).pop();},),
          ],
        ),
      ),
    );
  }
}
