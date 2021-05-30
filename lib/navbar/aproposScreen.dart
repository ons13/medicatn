import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'navbar_key.dart';

class aproposScreen extends StatefulWidget {
  @override
  _aproposScreenState createState() => _aproposScreenState();
}

class _aproposScreenState extends State<aproposScreen> {
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
