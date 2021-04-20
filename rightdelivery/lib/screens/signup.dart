import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rightdelivery/untility/my_stye.dart';
import 'package:rightdelivery/untility/nomal_dialog.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สมัครสมาชิก'),
      ),
      body: Container(
        color: Colors.green[600],
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            myLogo(),
            MyStyle().mySizeBox(),
            showAppName(),
            MyStyle().mySizeBox(),
            nameForm(),
            MyStyle().mySizeBox(),
            userForm(),
            MyStyle().mySizeBox(),
            passwordForm(),
            MyStyle().mySizeBox(),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStyle().showTitleH2('ชนิดของผู้ใช้'),
              ],
            ),
            userRadio(),
            shopRadio(),
            riderRadio(),
            MyStyle().mySizeBox(),
            registerButtom(),
          ],
        ),
      ),
    );
  }

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'User',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'ผู้สั่งอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );

  Widget shopRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Shop',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'เจ้าของร้านอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );

  Widget riderRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Rider',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'ผู้ส่งอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                onChanged: (value) => name = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.face,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Name :',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              )),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
              )),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
              )),
        ],
      );

  Widget registerButtom() => Container(
      width: 250.0,
      child: RaisedButton(
        color: Colors.green,
        onPressed: () {
          print(
              'name = $name , user = $user , password = $password , chooseType = $chooseType');
          if (name == null ||
              name.isEmpty ||
              user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty) {
            print('Have Space ');
            nomalDiglog(context, ('*กรุณากรอกข้อมูลให้ครบ*'));
          } else if (chooseType == null) {
            nomalDiglog(context, ('*โปรด เลือกชนิดของผู้ใช้*'));
          } else {
              checkUser();

          }
        },
        child: Text('สมัครสมาชิก', style: TextStyle(color: Colors.white)),
      )
      );

      Future <Null> checkUser()async{

        String url = 'http://192.168.56.1/ronpibonfood/getUserWhereUser.php?isAdd=true&user=$user';
         try {
           Response response = await Dio().get(url);
           if(response.toString() == 'null'){
               
             registerThread();
             
           }
           else{
             nomalDiglog(context, 'มีผู้ใช้ $user นี้ไปแล้ว กรุณาเปลี่ยนชื่อ User ใหม่');
           }
         } catch (e) {
         }

      }


Future<Null> registerThread()async{
   
  String url = 'http://192.168.1.105/rightdelivery/addUser.php?isAdd=true&Name=$name&User=$user&Password=$password&ChooseType=$chooseType';
 
  try {
    Response response = await Dio().get(url);
    print('res = $response');

    if(response.toString() == 'true'){

      Navigator.pop(context);

    }
    else {
      nomalDiglog(context, 'ไม่สามารถ สมัครได้ กรุณาลองใหม่');
    }
  } catch (e) {
  }

}



  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyStyle().showTitle('Ronpibon Food'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().showLogo(),
        ],
      );
}
