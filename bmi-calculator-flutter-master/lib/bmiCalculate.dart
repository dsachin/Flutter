import 'dart:math';

class BMICalculate {
  BMICalculate(this.height, this.weight);

  final int height;
  final int weight;
  double _bmi;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return "You have heighr than normal bod weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have normal body weight. Good job!";
    } else {
      return "You have lower than normal body weight. you can eat a bit more.";
    }
  }
}
