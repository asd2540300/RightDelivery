import 'package:flutter/material.dart';
import 'package:rightdelivery/screens/add_info_shop.dart';
import 'package:rightdelivery/untility/my_stye.dart';

class InfoShop extends StatefulWidget {
  @override
  _InfoShopState createState() => _InfoShopState();
}

class _InfoShopState extends State<InfoShop> {

  void arouteToAddInfo(){
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => AddInfoShop(),
     );
    Navigator.push(context, materialPageRoute);
      
  }

 
 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MyStyle().titleCenter(context, 'ยังไม่มีข้อมูล กรุณาเพิ่มข้อมูลก่อน'),
        addAndEditButton()
      ],
    );
  }

  Row addAndEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(margin: EdgeInsets.only(right: 16.0,bottom: 16.0),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                 arouteToAddInfo();}  
              ),
            ),
          ],
        ),
      ],
    );
  }
}