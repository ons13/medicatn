import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicatn/navbar/navbar_key.dart';
import 'package:medicatn/navbar/newsinfoScreen.dart';
import 'package:medicatn/router.dart';
import 'package:medicatn/widgets/custom_grid_view_item.dart';
import '../core/locator.dart';
import '../core/services/database_service.dart';
import '../TabBar2/medicament_details.dart';
import 'meds_list.dart';


class subCategoriesList extends StatefulWidget {

  final String subCategoryName;

  subCategoriesList(this.subCategoryName);

  @override
  _subCategoriesListState createState() => _subCategoriesListState();
}

class _subCategoriesListState extends State<subCategoriesList> {
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
                        final CurvedNavigationBarState navState =NavbarKey.getkey().currentState;
                        navState.setPage(0);

                        // do something
                      },
                    )
                ) ],
            )),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future:
              _databaseService.getAllsubCategory(this.widget.subCategoryName),
          builder: (context, snapshot) {
            return snapshot.hasData && !snapshot.hasError
                ? Container(
                color: Colors.white,
                    child:
                      GridView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {

                      return Card(
                      child: InkWell(
                      onTap: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,

                      builder: (context) =>
                         MedsList(snapshot.data[index].subCategory)),

                              child:  Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Image.asset(images[index]),
                                  Text(snapshot.data[index].subCategory)
                                  ],
                            ),
                            ));
                      },


                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0),
                      )
            ) : Center(
                 child: CircularProgressIndicator(
                    backgroundColor: Colors.green));
          },
        ));
  }
}  final images = [

  "images/bottle.png",
  "images/tablet1.png",
  "images/medicament-1.png",
  "images/refilling.png",
  "images/nasal-spray.png",
  "images/pills.png",
  "images/oral-vaccine.png",
  "images/vaccine1.png",
  "images/pills1.png",
  "images/oral-vaccine1.png",
  "images/nasal-spray.png",
  "images/pills2.png",
  "images/returns.png",
  "images/vaccine5.png",
  "images/medicine.png",
  "images/medicinebox.png",
  "images/medicament.png",
  "images/vaccine2.png",
  "images/sleeping-pills.png",
  "images/tablet.png",
  "images/vaccine3.png",
  "images/vaccine1.png",
  "images/vaccine4.png",
  "images/vitamin.png",

];
