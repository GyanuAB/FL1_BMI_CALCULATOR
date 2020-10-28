import 'package:flutter/material.dart';
class Reusablecard extends StatelessWidget {
  Reusablecard({@required this.Colour, this.cardChild, this.onPress});
  final Color Colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(

        child: cardChild,
        //height: 200,
        //width: 300,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colour,
          borderRadius: BorderRadiusDirectional.circular(15.0),
        ),
      ),
    );
  }
}
