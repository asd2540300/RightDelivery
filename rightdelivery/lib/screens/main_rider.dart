import 'package:flutter/material.dart';
import 'package:rightdelivery/untility/my_stye.dart';
import 'package:rightdelivery/untility/signout.dart';

class MainRider extends StatefulWidget {
  @override
  _MainRiderState createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showDrawer(),
      appBar: AppBar(
        title: Text('Main Rider'),
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
      accountName: Text('Name Rider'),
      accountEmail: Text('Please login'));
}
