import 'package:bmi_calculator/Calculator_brain.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'Widgets/Widgets.dart';

enum Gender { male, female }

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI calculator",
          style: labelTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ReUsabaleCard(
                    onTapFunction: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    childWidget: const GenderWidget(
                        icon: Icon(Icons.male, size: 60), text: "Male"),
                    colour: selectedGender == Gender.male
                        ? activecardcolor
                        : inactivecardcolor,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ReUsabaleCard(
                    onTapFunction: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    childWidget: const GenderWidget(
                      text: "Female",
                      icon: Icon(Icons.female, size: 60),
                    ),
                    colour: selectedGender == Gender.female
                        ? activecardcolor
                        : inactivecardcolor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUsabaleCard(
              colour: activecardcolor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: labelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.purple,
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        // activeColor: Colors.pink,
                        inactiveColor: Colors.blue,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ReUsabaleCard(
                    colour: activecardcolor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.remove,
                                function: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              function: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ReUsabaleCard(
                    colour: activecardcolor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.remove,
                                function: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              function: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calculateBmi = CalculatorBrain(
                  height: height.toDouble(), weight: weight.toDouble());

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ResultPage(result: calculateBmi.getBmi().toString());
                },
              ));
            },
            child: Container(
              child: Center(
                child: Text(
                  "Continue",
                  style: labelTextStyle,
                ),
              ),
              margin: const EdgeInsets.only(top: 10),
              color: Colors.pinkAccent,
              height: 60,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
