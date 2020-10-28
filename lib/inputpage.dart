import 'package:bmicalculator/result.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable.dart';
import 'constant.dart';
import 'calculate.dart';


enum Gender{
  Male,
  Female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender SelectedGender;
  int height = 180;
  int weight = 70;
  int age =19;
//Color malecardcolor = inactivecardcolor;
//Color femalecardcolor = inactivecardcolor;
//  void updateColor(int gender){
//  if(gender == 1){
//    if(malecardcolor == inactivecardcolor){
//      malecardcolor = activecardcolor;
//      femalecardcolor = inactivecardcolor;
//    }
//    else{
//      malecardcolor = inactivecardcolor;
//    }
//
//  }
//  if(gender == 2){
//    if(femalecardcolor == inactivecardcolor){
//      femalecardcolor = activecardcolor;
//      malecardcolor = inactivecardcolor;
//    }
//    else{
//      femalecardcolor = inactivecardcolor;
//    }
//  }
//}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('BMI Calculator')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Row(children: <Widget>[
         Expanded(
           child: Reusablecard(
             onPress: (){
               setState(() {
                 SelectedGender = Gender.Male;
               });
             },

             Colour : SelectedGender == Gender.Male ? KInactivecardcolor :KActivecardcolor,
            cardChild: IconContent(icon: FontAwesomeIcons.mars,
            label: 'MAle',),
           ),
         ),
          Expanded(
            child: Reusablecard(
              onPress: (){
                setState(() {
                  SelectedGender = Gender.Female;
                });
              },
              Colour : SelectedGender == Gender.Female ? KInactivecardcolor : KActivecardcolor ,
             cardChild: IconContent(icon: FontAwesomeIcons.venus,
               label: 'Female',),
            ),
          ),
        ],
        ),

        Expanded(
          child: Reusablecard(Colour : KActivecardcolor,

            cardChild: Column(children: <Widget>[
              Text('Height',style: TextStyle(fontSize: 15.0,color: Color(0xFF8D8E98)),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                Text(height.toString(),
                style: KTextstyle,),
                Text('cm',

                style: KNumberTextstyle,
                ),

              ],),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 40.0),
                ),
                child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    //activeColor: Color(0xFFEB1555),
                    //inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue){
                      setState(() {
                        height = newvalue.round();
                      });
                    }
                ),
              ),
            ],),

          ),
        ),
        Row(children: <Widget>[
          Expanded(
            child: Reusablecard(Colour :KActivecardcolor,
               cardChild: Column(
                children: <Widget>[

                     Container(
                        child: Text('Weight',style: TextStyle(color: Color(0xFF8D8E98)),),
    ),

                  Text(weight.toString(),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconData(
                      icon: FontAwesomeIcons.plus,
                      onPress: (){
                        setState(() {
                          weight++;
                        });
                      },),

                            SizedBox(width: 10.0,),

                      RoundIconData(
                               icon: FontAwesomeIcons.minus,
                                onPress: (){
                                 setState(() {
                                   weight--;
                                 });
                                },
                              ),

                    ],),


                     ],
                      ),
                      ),
                      ),
          Expanded(
            child: Reusablecard(Colour :KActivecardcolor,



              cardChild: Column(
                children: <Widget>[

                  Container(
                    child: Text('AGE',style: TextStyle(color: Color(0xFF8D8E98)),),
                  ),

                  Text(age.toString(),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconData(
                        icon: FontAwesomeIcons.plus,
                        onPress: (){
                          setState(() {
                            age++;
                          });
                        },),

                      SizedBox(width: 10.0,),

                      RoundIconData(
                        icon: FontAwesomeIcons.minus,
                        onPress: (){
                          setState(() {
                            age--;
                          });
                        },
                      ),

                    ],),


                ],
              ),
            ),
          ),
        ],
        ),
            Bottombutton(buttontitle: 'Calculate',
            onTap: (){


              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Result(
                bmiResult: calc.CalculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),
              ),
              );

            },
            ),
      ],
      )
    );
  }
}

class Bottombutton extends StatelessWidget {
  Bottombutton({@required this.onTap,@required this.buttontitle});
  final Function onTap;
  final String buttontitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        child: Center(child: Text(buttontitle,style: KLargebutton,)),
        color: KBottomcontainercolor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KHBottomContainerHeight,

      ),
    );
  }
}


class RoundIconData extends StatelessWidget {
  RoundIconData({@required this.icon, @required this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,

      ),
    shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
