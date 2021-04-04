import 'package:flutter/material.dart';
import 'package:medicatn/listvieweeet/listView1.dart';
import 'package:medicatn/listvieweeet/listView2.dart';
import 'package:medicatn/listvieweeet/listView3.dart';
import 'package:medicatn/listvieweeet/listView4.dart';
import 'package:medicatn/listvieweeet/listView5.dart';

class classetherapeutique extends StatefulWidget {
  @override
  _classetherapeutiqueState createState() => _classetherapeutiqueState();
}

class _classetherapeutiqueState extends State<classetherapeutique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor:Color.fromRGBO(46, 112, 74, 1),
      backgroundColor: Colors.white,
      body: BodyLayout(),

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
              title: Text('ANTINFECTIEUX GENERAUX A USAGE SYSTEMIQUE',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15), ),
              onTap: () {
                _pushScreen(context,listView1() );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('ANTINEOPLASTIQUE ET IMMUNOMODULATEURS',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
              onTap: () {
                _pushScreen(context,listView2() );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('ANTIPARASITAIRES-INSECTICIDES',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
              onTap: () {
                _pushScreen(context,listView3() );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('APPAREIL DIGESTIF ET METABOLISME',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
              onTap: () {
                _pushScreen(context,listView4() );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('DIVERS',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
              onTap: () {
                _pushScreen(context,listView5(), );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('HORMONES SYSTEMIQUE,HOMONE SEXUELLE EXCLUE',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
              onTap: () {
                _pushScreen(context,listView5() );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('MEDICAMENTS DERMATOLOGIQUES',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
              onTap: () {
                _pushScreen(context,listView1() );
              },
            ),
          ),

          Card(
            child:
            ListTile(
              title: Text('MUSCLE ET SQUELETTE',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
              onTap: () {
                _pushScreen(context,listView1() );
              },
            ),
          ),
          Card(
            child:
            ListTile(
              title: Text('ORGANES SENSORIELS',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
              onTap: () {
                _pushScreen(context,listView1() );
              },
            ),
          ),
      Card(
      child:
          ListTile(
            title: Text('SANG ET ORGANES HEMATOPOIETIQUE',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
            onTap: () {
              _pushScreen(context,listView1() );
            },
          ),
        ),
        Card(
        child:
        ListTile(
            title: Text('SYSTEME CARDIOVASCULAIRE',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
          onTap: () {
            _pushScreen(context,listView2() );
          },
          ),),
          Card(
          child:
          ListTile(
            title: Text('SYSTEME GENITO URINAIRE ET HORMONES SEXUELLES',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
            onTap: () {
              _pushScreen(context,listView3() );
            },
          ),),
          Card(
          child:
          ListTile(
            title: Text('SYSTEME NERVEUX',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
            onTap: () {
              _pushScreen(context,listView4() );
            },

          ),),
          Card(
          child:
          ListTile(
            title: Text('SYSTEME RESPIRATOIRE',style: TextStyle (fontFamily:"Brand-Regular",fontSize:15),),
            onTap: () {
              _pushScreen(context,listView5() );
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

