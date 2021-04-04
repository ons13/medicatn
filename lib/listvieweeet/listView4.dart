import 'package:flutter/material.dart';

import 'listView1.1.dart';
class listView4 extends StatefulWidget {
  @override
  _listView4State createState() => _listView4State();
}

class _listView4State extends State<listView4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.white,
      body: BodyLayout(),
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(46, 112, 74, 1),

        title: Text('Classe Thérapeutique', style: TextStyle (fontFamily:"Brand Bold",fontSize:15),),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),

    );
  }
}
class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}


Widget _myListView(BuildContext context) {
  return ListView(
    children: ListTile.divideTiles( //          <-- ListTile.divideTiles
        context: context,
        tiles: [
          Card(
            child:
            ListTile(
              title: Text('ANTIVIRAUX(USAGE SYSTEMIQUE)'),
              onTap: () {
                _pushScreen(context,listView11() );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('MEDICAMENT CONTRE LES MYCOBACTERIES'),
              onTap: () {
                _pushScreen(context,listView11() );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('SERUMS IMMUNISANTS ET IMMUNOGLOBULINES'),
              onTap: () {
                _pushScreen(context,listView11() );
              },
            ),),
          Card(
            child:
            ListTile(
              title: Text('VACCINS'),
              onTap: () {
                _pushScreen(context,listView11() );
              },
            ),),
        ]
    ).toList(),
  );

}

void _pushScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}