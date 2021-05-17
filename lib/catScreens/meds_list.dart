import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicatn/TabBar2/Details.dart';
import 'package:medicatn/core/services/database_service.dart';
import 'package:medicatn/navbar/navbar_key.dart';
import 'package:medicatn/navbar/newsinfoScreen.dart';
import 'package:medicatn/router.dart';
import 'package:medicatn/widgets/custom_grid_view_item.dart';
import '../core/locator.dart';
import '../TabBar2/medicament_details.dart';

class MedsList extends StatefulWidget {
  final String medicamentName;

  MedsList(this.medicamentName);

  @override
  _MedsListState createState() => _MedsListState();
}

class _MedsListState extends State<MedsList> {
  DatabaseService _databaseService = locator<DatabaseService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:

        PreferredSize(
            preferredSize: Size.fromHeight(75.0),

        child : AppBar(

        leading:
        Padding(padding: EdgeInsets.only(top: 25),

           child:  IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
           )),
          backgroundColor:Color.fromRGBO(46, 112, 74, 1),

              title:
              Padding(
                padding: EdgeInsets.only(top: 30),


                child:  Text('Classe Thérapeutique',
              style: TextStyle (fontFamily:"Brand Bold",fontSize:15 ),
                  )),
                actions: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20),
                   child :   IconButton(
                        icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size:30 ,
                     ),
                     onPressed: () {

                  },))],
    )),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future:
          _databaseService.getAllMedicaments(this.widget.medicamentName),
          builder: (context, snapshot) {
            return snapshot.hasData && !snapshot.hasError
                ? Container(

                  color: Colors.white,
                  child: ListView.builder(

                     itemCount: snapshot.data.length,
                     itemBuilder: (context, index) {
                    return Container(
                      height: 70,

                      child: Card(

                          margin: EdgeInsets.all(9),

                          shadowColor: Colors.green,
                          elevation: 3,

                          child: InkWell(

                            //This function serves the purpose of showing the next screen as bottomsheet
                            onTap: () =>  Navigator.push(
                             context,
                             MaterialPageRoute(
                             builder: (context) =>
                                 //DetailsPage()),
                                 MedicamentDetails(medicament: snapshot.data[index])),
                                /*showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) =>MedicamentDetails(medicament: snapshot.data[index])),*/
                               //MedicamentDetails(
                                 //   medicament: snapshot.data[index])
                                ),
                             child: Column(

                              children: [

                                 Padding(
                                   padding: const EdgeInsets.only(left: 15 ),
                                   child: Text(snapshot.data[index].name,
                                    textAlign: TextAlign.right,
                                    style: TextStyle( fontSize: 13,
                                    color: Colors.black,),
                                  ),
                                  )
                               ],
                             ),
                           )),

                        );
                   },
                  )
                 )
                 : Center(
                   child: CircularProgressIndicator(
                    backgroundColor: Colors.green));
          },
        ));
  }
}