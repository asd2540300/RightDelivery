import 'package:flutter/material.dart';
 
import 'package:rightdelivery/untility/my_stye.dart';
import 'package:rightdelivery/untility/signout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showDrawer(),
      appBar: AppBar(
        
        title: Text('Main User'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutProcess(context))
        ],
      ),
    );
  }

Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
             
          ],
        ),
      );
  UserAccountsDrawerHeader showHead() => UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('guest.jpg'),  
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Name User'),
      accountEmail: Text(' login'));
}
