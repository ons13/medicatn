import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/ASUS/AndroidStudioProjects/medicatn/lib/TabBar2/Details.dart';
import '../list_of_data.dart';
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
class MedicaItemsSearch extends SearchDelegate<MedicaItem>{



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
  return DetailsPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  final mylist = query.isEmpty? loadMedicaItem()
      :loadMedicaItem().where((p) => p.title.startsWith(query)).toList() ;
  return mylist.isEmpty? Text('No Results Found...',
    style: TextStyle(fontFamily:"Brand-Regular",fontSize:20 ),):
   ListView.builder(
      itemCount:mylist.length ,
      itemBuilder: (context,i){
        final MedicaItem listitem= mylist[i];
        return ListTile(

          onTap: (){
            showResults(context);
          },
          title:
         Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Text(listitem.title,style: TextStyle(
                fontFamily: "Brand Bold",

                fontSize:16),),
            Text(listitem.category,style:TextStyle(
              color: Color.fromRGBO(46, 112, 74, 1),
              fontFamily: "Brand-Regular",
                fontSize:20) ,),
           Divider()
          ],
        ),);
      });
  }

}


