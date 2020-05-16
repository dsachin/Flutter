import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/result_Page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottomNavigationButton.dart';
import 'constants.dart';
import 'bmiCalculate.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableExpanded(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    reusableCard: ReusableDataWidget(
                        icon: FontAwesomeIcons.mars, iconText: "Male"),
                  ),
                ),
                Expanded(
                  child: ReusableExpanded(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    reusableCard: ReusableDataWidget(
                        icon: FontAwesomeIcons.venus, iconText: "Female"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ReusableExpanded(
                      color: widgetColor,
                      reusableCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Height',
                            style: labelTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: labelTextStyle,
                                ),
                              ]),
                          Slider(
                              value: height.toDouble(),
                              min: 150,
                              max: 250,
                              activeColor: Color(0xFFEB1555),
                              inactiveColor: Color(0xFF8D8E98),
                              onChanged: (double newHeight) {
                                setState(() {
                                  height = newHeight.round();
                                });
                              }),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableExpanded(
                    color: widgetColor,
                    reusableCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                child: ReusableExpanded(
                    color: widgetColor,
                    reusableCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundActionButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RoundActionButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ]),
                      ],
                    )),
              ),
            ],
          )),
          BottomNavigationButton(
            title: "Calculate",
            onTap: () {
              BMICalculate calc = BMICalculate(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculate(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {
  RoundActionButton({@required this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
