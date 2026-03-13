import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon _Content.dart';
import '../Components/reusable_Card.dart';
import '../constants.dart';
import 'results.dart';
import '../Components/roundIconButton.dart';
import '../Components/bottomButton.dart';
import 'package:bmi/calculator_Brain.dart';



enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender ? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                      colour: selectedGender == Gender.male? kActiveCardColor: kInactiveCardColor,
                      cardChild: IconContent(
                        icons: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress:  (){
                      setState(() {
                        //updateCardColor(Gender.female);
                        selectedGender = Gender.female;
                      });
                    },
                      colour: selectedGender == Gender.female? kActiveCardColor: kInactiveCardColor,
                      cardChild: IconContent(
                        icons: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ReusableCard(colour: kActiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HEIGHT', style: kLabelTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(), style: kNumTextStyle,),
                  Text('cm', style: kLabelTextStyle,)
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x39EB1555),
                ),
                child: Slider(value: height.toDouble(),
                    max: 300,
                    min: 100,
                    onChanged: (double newValue){
                  setState(() {
                    height = newValue.round();
                  });
                    }),
              )
            ],
          ),)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT', style: kLabelTextStyle,),
                    Text(weight.toString(), style: kNumTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                    [
                      RoundIconButton(
                        icons: FontAwesomeIcons.minus,
                        onPress: (){
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(width: 10.0,),
                      RoundIconButton(
                        icons: FontAwesomeIcons.plus,
                        onPress: (){
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],),
                  ],
                ),)),
                Expanded(child: ReusableCard(colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE', style: kLabelTextStyle,),
                    Text(age.toString(), style: kNumTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icons: FontAwesomeIcons.minus, onPress: (){setState(() {
                          age--;
                        });}),
                        SizedBox(width: 10.0,),
                        RoundIconButton(icons: FontAwesomeIcons.plus, onPress: (){setState(() {
                          age++;
                        });})
                      ],
                    )
                  ],
                ),)),
              ],
            ),
          ),
          BottomButton(
            bottomTitle: 'CALCULATE',
            onPress: (){
              
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
              
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return ResultPage(
                      bmiResult: calc.calculatorBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  })
              );
            },

          ),
        ],
      ),
    );
  }
}

