import 'package:bmicalculator/constant.dart';
import 'package:bmicalculator/reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'inputpage.dart';
import 'calculate.dart';
import 'reusable.dart';
import 'constant.dart';
import 'icon_content.dart';
class Result extends StatelessWidget {
  Result({@required this.bmiResult, @required this.resultText, @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(
            child: Center(
              child: Text('Your Result',style: Ktitletextstyle,),
            ),
          ),


          Expanded(
          flex: 5,
            child: Reusablecard(
              Colour: KActivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: Kresulttextstyle,),
                  Text(bmiResult,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 100.0),),
                  Text(interpretation,textAlign: TextAlign.center,style: TextStyle(fontSize: 22.0),),

                ],


              ),
            ),
          ),
          Bottombutton(buttontitle: 'Re-Calculate',
            onTap: (){
              Navigator.pop(context);

            },
          ),
        ],
      ),);
  }
}
