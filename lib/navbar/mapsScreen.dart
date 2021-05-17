import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'navbar_key.dart';

class mapScreen extends StatefulWidget {
  @override
  _mapScreenState createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 70.0,
                color: Colors.green[800],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("click here to access to a map where can you found all nearby medical stores",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 20.0,),
              Text(""),
              RaisedButton(onPressed: ()
              {},
              color: Colors.green[900],
                child: Text("Get your map", style: TextStyle(color: Colors.white),),
                )

          ],

          ),
        ));


  }
}
