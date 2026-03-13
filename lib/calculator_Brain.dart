
import 'dart:math';

class CalculatorBrain{
CalculatorBrain({required this.weight, required this.height});

  final int height;
  final int weight;

 late double _bmi;

String calculatorBMI(){
  _bmi = weight / pow(height/100, 2);
  return _bmi.toStringAsFixed(1);
}

String getResult(){
  if(_bmi >= 25){
    return 'Overweight';
  }else if(_bmi > 18.5) {
    return 'Normal';
  }else{
    return 'Underweight';
  }
}

String getInterpretation(){
  if(_bmi >= 25){
    return 'Fast for 40 years';
  }else if(_bmi> 18.5) {
    return 'Congratulation, you are healthy';
  }else{
    return 'feel, free to eat all the cakes you want';
  }
}

}