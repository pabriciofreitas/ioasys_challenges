// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:imc/ui/pages/calculadora_imc/calculator_imc_presenter.dart';

class ValueNotifierCalculatorImcPresentear implements CalculatorImcPresentear {
  @override
  final labelStatusValue = ValueNotifier<String>("Digite os valores");

  String get labelStatus => labelStatusValue.value;
  set labelStatus(String value) => labelStatusValue.value = value;
  @override
  void calcular(String weight, String height) {
    double _weight = double.parse(weight);
    double _height = double.parse(height) / 100;
    double imc = _weight / (_height * _height);
    labelStatus = "${_getInterpretation(imc)} (${imc.toStringAsFixed(2)})";
  }

  //
  String _getInterpretation(double imc) {
    if (imc < 17) {
      return "Muito abaixo do peso";
    } else if (imc >= 17 && imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc >= 18.5 && imc < 25) {
      return "Peso normal";
    } else if (imc >= 25 && imc < 30) {
      return "Acima do peso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade Grau II";
    } else {
      return "Obesidade Grau III";
    }
  }

  @override
  void reset() {
    labelStatus = "Digite os valores";
  }

  @override
  void dispose() {
    labelStatusValue.dispose();
  }
}