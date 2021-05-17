import 'package:flutter/material.dart';
import 'package:medicatn/core/locator.dart';
import 'package:medicatn/core/services/database_service.dart';

import '../catScreens/subcategories _list.dart';


class classetherapeutique extends StatefulWidget {
  @override
  _classetherapeutiqueState createState() => _classetherapeutiqueState();
}

class _classetherapeutiqueState extends State<classetherapeutique> {
  DatabaseService _databaseService = locator<DatabaseService>();

  @override


Widget build(BuildContext context) {
  DatabaseService _databaseService = locator<DatabaseService>();

  return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _databaseService.getAllMedicamentCategories(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
              color: Colors.white,
              child: /*GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: 300,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Card(
                            color: Colors.amber,
                            child: Center(child: Text('$index')),
                          ),
                          onTap: ()
                           // Navigator.pushNamed(
                            //context, AppRouter.Test());
                            =>//Navigator.push(
                             //   context,
                           //     MaterialPageRoute(builder: (context) => Test())
                            print("helloo onnns "));

                      }*/

                   GridView.builder(
                     itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                          return Card(
                                child: InkWell(
                                  onTap: () => showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,

                                      builder: (context) =>
                                          subCategoriesList(snapshot.data[index].dvs)),

                                    child:  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(images[index]),
                                        Text(snapshot.data[index].dvs,  style:TextStyle(
                                          fontWeight: FontWeight.bold,fontFamily: 'Brand Bold',fontSize: 11),
                                ),


                              ],
                            ),
                          ));/*Card(
                                  child:CustomGridViewItem (
                                 title:snapshot.data[index].dvs, //  aaaaa khater ahna hatina hello ? ey

                                      onClick:() => print("heyy")),
                                // Navigator.pushNamed(
                                    //context, AppRouter.MedsList())),
                                  //child: Text(snapshot.data[index].dvs,  style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                                  )
                                ),*/
                      //  onTap: () =>
                      //print("heyy")),
                      //showModalBottomSheet(
                      //context: context,
                      //isScrollControlled: true,

                      //builder: (context) =>MedsList(snapshot.data[index].dvs))),


                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3.0,
                        mainAxisSpacing: 5.0),


               )
          ) : Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.green));
        },
      ));
}
  final images = [
    "assets/coronavirus.png",
    "assets/cancer.png",
    "assets/insecticide.png",
    "assets/stomach.png",
    "assets/packing.png",
    "assets/gender.png",
    "assets/skin.png",
    "assets/muscle.png",
    "assets/brain.png",
    "assets/sense.png",
    "assets/blood.png",
    "assets/heart.png",
    "assets/heart.png",
    "assets/uterus.png",
    "assets/neuron.png",
    "assets/lungs.png",

  ];
}
