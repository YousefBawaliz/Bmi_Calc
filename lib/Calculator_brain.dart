import 'dart:math';

class CalculatorBrain {
  double weight;
  double height;

  CalculatorBrain({required this.weight, required this.height});

  String getBmi() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }
}
