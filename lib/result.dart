import 'package:flutter/material.dart';
import 'package:flutter_first_project/constants.dart';
import 'package:flutter_first_project/main.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi});

  final String bmi;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 180,),
                Text(
                  'YOUR BMI IS',
                  style: kResultTextStyle,
                ),
                SizedBox(height: 30,),
                Text(
                  bmi,
                  style: kBMITextStyle,
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 80,
                      child: Container(
                        color: kBottomContainerColor,
                        child: Center(
                            child: Text('RECALCULATE MY BMI',
                                style: kLargeButtonTextStyle)),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
