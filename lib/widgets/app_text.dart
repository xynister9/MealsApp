
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final bool isbold;
  final Color color;
  final String font ;

  const AppText(
      {Key? key,
      required this.text,
      required this.size,
      this.isbold = false,
      this.color = Colors.black,
      this.font = 'Raleway'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ,
      style : TextStyle(
        fontWeight: (isbold? FontWeight.bold : FontWeight.normal) ,
        color: color ,
        fontSize: size ,
        fontFamily: font ,
       ),
    ) ;
  }
}

class AppBarText extends StatelessWidget {

  final String text ;
  
  const AppBarText({Key? key , required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text , style: const TextStyle( fontFamily : 'Raleway') , ) ;
  }
}