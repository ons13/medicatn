import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicatn/catScreens/meds_list.dart';
import 'package:medicatn/core/constants/queries.dart';
import 'package:medicatn/core/datasource/database_initializer.dart';
import 'package:medicatn/core/locator.dart';
import 'package:medicatn/core/models/medicament.dart';
import 'package:medicatn/core/services/database_service.dart';
import 'file:///C:/Users/ASUS/AndroidStudioProjects/medicatn/lib/TabBar2/Details.dart';
//import '../list_of_data.dart';
import 'navbar_key.dart';
import 'favorisScreen.dart';
import 'mapsScreen.dart';
import 'constantebioScreen.dart';
import 'newsinfoScreen.dart';
import 'aproposScreen.dart';
import 'classethérapeutiqueScreen.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainscreen";
  static const PrimaryColor = const Color(0xFF151000);


  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int pageIndex =0;
//create all the pages
  final newsinfo _newinfo =newsinfo();
  final classetherapeutique _classetherapeutique =classetherapeutique();
  final favScreen _favScreen =favScreen();
  final constantebio _constantebio =constantebio();
  final mapScreen _mapScreen =mapScreen();
  final aproposScreen _aproposScreen =aproposScreen();
  Widget _showPage =new newsinfo();
  Widget _pageChooser(int page){
    switch(page){
      case 0:
        return _newinfo;
        break;
      case 1:
        return _classetherapeutique;
        break;
      case 2:
        return _favScreen;
        break;
      case 3:
        return _constantebio;
        break;
      case 4:
        return _mapScreen;
        break;
      case 5:
        return _aproposScreen;
        break;
      default: return new Container(
        child: new Center(
            child : new Text (
                'no page found by page chooser'
            )
        ),
      );
    }
  }


  // final screen =[newsinfo(),classetherapeutique(), favScreen(),constantebio(),mapScreen(),aproposScreen()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar( color: Color.fromRGBO(46, 112, 74, 1),

        index: pageIndex,
        //backgroundColor:Color.fromRGBO(46, 112, 74, 1),
        backgroundColor:Colors.white,
        key: NavbarKey.getkey(),
        items: <Widget>[
          Icon(Icons.autorenew_sharp, size: 30, color: Colors.white),
          Icon(Icons.list, size: 30,color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.biotech_rounded, size: 30, color: Colors.white),
          Icon(Icons.map_outlined, size: 30, color: Colors.white),
          Icon(Icons.info, size: 30, color: Colors.white),

        ],
        onTap: (index) {
          setState(() {
            _showPage=_pageChooser(index);
          });
          //Handle button tap
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(microseconds:300 ),
      ),
      body: Container(  color: Color.fromRGBO(46, 112, 74, 1),
        child:  _showPage,
      ),

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Nom commercial,DCI',
          style: TextStyle( color: Colors.black,
              fontFamily: "Brand-Regular",
              fontSize:20),),
        backgroundColor: Colors.white,

        actions: <Widget>[

          IconButton(icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                //bch nediw aalih lenaa
                showSearch(context: context, delegate: MedicaItemsSearch());

              })
        ],
      ),

    );
  }
}
//tawa bch nekhdmou el db el class
class MedicaItemsSearch extends SearchDelegate<Medicament>{
  DatabaseInitializer _databaseInitializer = locator<DatabaseInitializer>();

  Future<List<Medicament>> getAllMedicaments(String criteria) async {
    try {
      var dbClient = await _databaseInitializer.db;
      var res = await dbClient.rawQuery(allMedicaments + criteria + "';");
      List<Medicament> list = res.isNotEmpty
          ? res.map((c) => Medicament.fromMap(c))
          : null;
      return list;
    } catch (e) {
      print("[Database Service] getAllMeds $e");
      return List.empty();
    }
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed:(){

      query="";

    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);


      } , icon: Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
    //bch nemchi page okhra
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty? getAllMedicaments
        :getAllMedicaments;
   return ListView.builder(
        itemBuilder: (context,i){
          final Future<List<Medicament>> Function(String criteria) listitem= mylist   ;
          return ListTile(

            onTap: (){
              showResults(context);
            });
        });
  }

}