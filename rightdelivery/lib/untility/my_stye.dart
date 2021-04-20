 

import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.white;
  Color primaryColor = Colors.green[400];

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/$namePic'), fit: BoxFit.cover),
    );
  }

  SizedBox mySizeBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 28.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );

  Text showTitleH2(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );

  Container showLogo() {
    return Container(
      width: 240,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget titleCenter(BuildContext context,String string) {
    return Center(
      child: Container(width: MediaQuery.of(context).size.width*0.5,
        child: Text(
          string,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  MyStyle();
}
