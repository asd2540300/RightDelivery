import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rightdelivery/model/user_model.dart';
import 'package:rightdelivery/screens/main_rider.dart';
import 'package:rightdelivery/screens/main_shop.dart';
import 'package:rightdelivery/screens/main_user.dart';
import 'package:rightdelivery/untility/my_stye.dart';
import 'package:rightdelivery/untility/nomal_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เข้าสู่ระบบ'),
      ),
      body: Container(
        color: Colors.green[600],
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().showTitle('Ronpibon Food'),
                MyStyle().mySizeBox(),
                userForm(),
                MyStyle().mySizeBox(),
                passwordForm(),
                MyStyle().mySizeBox(),
                loginButtom()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButtom() => Container(
      width: 250.0,
      child: RaisedButton(
        color: Colors.green,
        onPressed: () {
            if (user == null || user.isEmpty || password == null || password.isEmpty) {
              nomalDiglog(context, 'มีช่องวาง กรุณากรอกให้ครบ');
            } else {
              checkAuthen();
            } 

        },
        child: Text('Login', style: TextStyle(color: Colors.white)),
      )
      );


    Future<Null>checkAuthen() async{
    String url = 'http://192.168.56.1/ronpibonfood/getUserWhereUser.php?isAdd=true&user=$user';
    
    try {
      
      Response response = await Dio().get(url);
      print('res =$response');

    var result =json.decode(response.data);
    print('result =$result');
    
    for(var map in result)
    {
      UserModel userModel = UserModel.fromJson(map);
      if (password == userModel.password) {
        String chooseType = userModel.chooseType;
        if (chooseType == 'User') {
          routeToService(MainUser(), userModel);
        } else if (chooseType == 'Shop') {
            routeToService(MainShop(),userModel);
        }
        else if (chooseType == 'Rider'){
          routeToService(MainRider(),userModel);

        }
        else{
          nomalDiglog(context, 'Error');
        }
      } else {
        nomalDiglog(context, 'รหัสผ่านไม่ถูกต้อง');
      }



    }

    } catch (e) {

    }



}

    void routeToService(Widget myWidget, UserModel userModel) async {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('id', userModel.id);
      preferences.setString('chooseType', userModel.chooseType);
      preferences.setString('Name', userModel.name);


            MaterialPageRoute route = MaterialPageRoute(builder: (context) => myWidget,);
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    }



  Widget userForm() => Container(
      width: 250.0,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_box,
            color: MyStyle().darkColor,
          ),
          labelStyle: TextStyle(color: MyStyle().darkColor),
          labelText: 'User :',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor)),
        ),
      ));

  Widget passwordForm() => Container(
      width: 250.0,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: MyStyle().darkColor,
          ),
          labelStyle: TextStyle(color: MyStyle().darkColor),
          labelText: 'password :',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor)),
        ),
      ));
}
