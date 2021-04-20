import 'package:flutter/material.dart';
import 'package:rightdelivery/screens/main_rider.dart';
import 'package:rightdelivery/screens/main_shop.dart';
import 'package:rightdelivery/screens/main_user.dart';
import 'package:rightdelivery/screens/signIn.dart';
import 'package:rightdelivery/screens/signup.dart';
import 'package:rightdelivery/untility/my_stye.dart';
import 'package:rightdelivery/untility/nomal_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Future<Null> checkPreferance() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String chooseType = preferences.getString('ChooseType');
      if (chooseType != null && chooseType.isNotEmpty) {
        if (chooseType == 'User') {
          routeToService(
            MainUser(),
          );
        } else if (chooseType == 'Shop') {
          routeToService(
            MainShop(),
          );
        } else if (chooseType == 'Rider') {
          routeToService(
            MainRider(),
          );
        } else {
          nomalDiglog(context, 'Error User Type');
        }
      } else {}
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => myWidget);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            signInMenu(),
            signUpMenu(),
          ],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign In'),
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign Up'),
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHead() => UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('guest.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Guest'),
      accountEmail: Text('Please login'));
}
