import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/models/medicament.dart';
import 'Details.dart';
class MedicamentDetails extends StatefulWidget {
  final Medicament medicament;

  MedicamentDetails({this.medicament});

  @override
  _MedicamentDetailsState createState() => _MedicamentDetailsState();
}

class _MedicamentDetailsState extends State<MedicamentDetails> {

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(

         appBar:  AppBar(
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
      backgroundColor: Colors.white,
        body: Padding(

          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(

              /*decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),*/
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.medicament.name),
                  Text(widget.medicament.dvs),
                  Text(widget.medicament.desc)
                ],
          ),
        )));
  }
}
