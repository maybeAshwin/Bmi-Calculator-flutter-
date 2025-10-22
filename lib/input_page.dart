import 'package:bmicalculator/calculations.dart';
import 'package:bmicalculator/result_page.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'extracted_buttons.dart';
import 'icon_details.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleInactiveColor = kInactiveContainerColor;
  Color femaleInactiveColor = kInactiveContainerColor;
  int height = 180;
  int weight = 70;
  int age = 30;



  void changeColor(int gender) {
    if (gender == 1) {
      if (maleInactiveColor == kInactiveContainerColor) {
        maleInactiveColor = kActiveCardColor;
        femaleInactiveColor = kInactiveContainerColor;
      } else {
        maleInactiveColor = kInactiveContainerColor;
      }
    }
    if (gender == 2) {
      if (femaleInactiveColor == kInactiveContainerColor) {
        femaleInactiveColor = kActiveCardColor;
        maleInactiveColor = kInactiveContainerColor;
      } else {
        femaleInactiveColor = kInactiveContainerColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeColor(1);
                        });
                      },
                      child: ReusableCard(
                        cardChild: IconDetails(
                          icon: Icons.male_sharp,
                          label: 'MALE',
                        ),
                        colour: maleInactiveColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeColor(2);
                        });
                      },
                      child: ReusableCard(
                        cardChild: IconDetails(
                          icon: Icons.female_sharp,
                          label: 'FEMALE',
                        ),
                        colour: femaleInactiveColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kTextStyle),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: kNumberStyle,
                        ),
                        Text('cm', style: kTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 250,
                        activeColor: kBottomContainerColor,
                        inactiveColor: kActiveCardColor,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                colour: kInactiveContainerColor,
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: kTextStyle),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceEvenly,

                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),

                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kInactiveContainerColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kTextStyle),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kInactiveContainerColor,
                    ),
                  ),
                ],
              ),
            ),

            BottomButton(
              buttonName: 'CALCULATE YOUR BMI',
              onClick: () {
                Calculations calc=Calculations(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage( bmiResultValue:calc.calculator() ,bmiResults: calc.getResult(),interP:calc.getInterP(),colors: calc.getResultColor(),),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
