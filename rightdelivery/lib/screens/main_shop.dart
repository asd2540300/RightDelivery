import 'package:flutter/material.dart';
import 'package:rightdelivery/untility/my_stye.dart';
import 'package:rightdelivery/untility/signout.dart';
import 'package:rightdelivery/widget/info_shop.dart';
import 'package:rightdelivery/widget/list_food_menu_shop.dart';
import 'package:rightdelivery/widget/order_list_shop.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showDrawer(),
      body: currentWidget,
      appBar: AppBar(
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            homeMenu(),
            foodMenu(),
            informationMenu(),
            signOutMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('รายการอาหารที่ ลูกค้าสั่ง'),
        subtitle: Text('รายการอาหารที่ยังไม่ได้ส่ง'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('รายการอาหารที่'),
        subtitle: Text('รายการอาหาร ของร้าน'),
        onTap: () {
          setState(() {
            currentWidget = ListFoodMenuShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile informationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('รายละเอียด ของร้าน'),
        subtitle: Text('รายละเอียด ของร้าน พร้อมEdit'),
        onTap: () {
          setState(() {
            currentWidget = InfoShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Sign Out'),
        subtitle: Text('Sign Out ออกจากระบบ'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHead() => UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('guest.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Name Shop'),
      accountEmail: Text('Please login'));
}
