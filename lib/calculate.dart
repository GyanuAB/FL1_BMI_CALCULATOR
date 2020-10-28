import 'dart:math';
import 'inputpage.dart';

import 'main.dart';
class CalculatorBrain{
  CalculatorBrain({this.weight,this.height});
  final int height;
  final int weight;

  double _bmi;
 String CalculateBMI(){
   _bmi = weight/pow(height/100, 2);
   return _bmi.toStringAsFixed(1);
 }
 String getResult(){
   if(_bmi>=25){
     return 'Overweight';}
   else if (_bmi>18.5){
     return 'Normal';}
   else {
     return 'Underweight';
   }
 }
String getInterpretation(){
  if(_bmi>=25) {
    return 'You have a higher than a normal body Weight.You should exercise more.';
  }else if (_bmi>18.5) {
    return 'You have a normal body weight.';
  }else
   { return'You have a lower than a normal body weight.You should eat a little bit more.';
   }
 }
}