import 'package:flutter/material.dart';
import 'package:flutter_first_project/constants.dart';
import 'package:flutter_first_project/result.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}

enum Gender { male, female }

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.male;
  var age = 20;
  var height = 150;
  var weight = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBG,
        appBar: AppBar(
          backgroundColor: kBG,
          title: Text(
            "BMI CALCULATOR",
            style: kBodyTextStyle,
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    color: gender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(FontAwesomeIcons.mars, size: 100),
                        SizedBox(height: 20),
                        Text('MALE', style: kBodyTextStyle)
                      ],
                    ),
                  )), // male box
                  Expanded(
                      child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    color: gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(FontAwesomeIcons.venus, size: 100),
                        SizedBox(height: 20),
                        Text('FEMALE', style: kBodyTextStyle)
                      ],
                    ),
                  )), //female box
                ],
              ), // gender choose
            ),
            Expanded(
              child: ReusableCard(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kBodyTextStyle,
                  ),
                  Text(
                    height.toString() + 'cm',
                    style: kNumberTextStyle,
                  ),
                  Slider(
                      min: 130,
                      max: 220,
                      activeColor: kBottomContainerColor,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      })
                ],
              )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kBodyTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              fillColor: kButtonColor,
                              constraints: BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              elevation: 10,
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              fillColor: kButtonColor,
                              constraints: BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              elevation: 10,
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )), // weight
                  Expanded(
                      child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kBodyTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              fillColor: kButtonColor,
                              constraints: BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              elevation: 10,
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              fillColor: kButtonColor,
                              constraints: BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              elevation: 10,
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )), // age
                ],
              ),
            ), // values change boxes
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  final heightM = height / 100;
                  final res = weight / (heightM * heightM);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmi: res.round().toString(),
                        ),
                      ));
                },
                child: Container(
                    height: 80,
                    child: Container(
                      color: kBottomContainerColor,
                      child: Center(
                          child: Text('CALCULATE MY BMI',
                              style: kLargeButtonTextStyle)),
                    )))
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final Function? onTap;

  ReusableCard({
    Key? key,
    this.color = kInactiveCardColor,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap!(),
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: child,
        ));
  }
}
