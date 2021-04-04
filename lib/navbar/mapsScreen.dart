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
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('waa '),
          onPressed: (){
            final CurvedNavigationBarState navState =NavbarKey.getkey().currentState;
            navState.setPage(0);
          },
        ),
      ),

    );
  }
}
