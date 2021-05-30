import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../core/models/medicament.dart';
class MedicamentDetails extends StatefulWidget {

  final Medicament medicament;

  MedicamentDetails({this.medicament});

  @override
  _MedicamentDetailsState createState() => _MedicamentDetailsState();
}

class _MedicamentDetailsState extends State<MedicamentDetails> {
 bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child:
     Scaffold(
       appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child:   AppBar(
         backgroundColor: Color.fromRGBO(46, 112, 74, 1),
           bottom: TabBar(
             isScrollable: true,
             indicatorColor: Colors.white,
               indicatorWeight: 6.0,
               onTap: (index){
               setState(() {
                 switch(index){

                   case 0:
                     RenderErrorBox.backgroundColor=Color.fromRGBO(46, 112, 74, 1);
                     break;
                   case 1:
                     RenderErrorBox.backgroundColor=Color.fromRGBO(46, 112, 74, 1);
                     break;
                   case 2:
                     RenderErrorBox.backgroundColor=Color.fromRGBO(46, 112, 74, 1);
                     break;
                   case 3:
                     RenderErrorBox.backgroundColor=Color.fromRGBO(46, 112, 74, 1);
                     break;
                   default :
               }
               });
               },
               tabs: <Widget>[
             Tab(
               child:Container(
               child: Text(
                 'HOME',
                 style: TextStyle(color: Colors.white, fontSize: 18.0),
               ),
             ),
             ),
                 Tab(
                   child:Container(
                     child: Text(
                       'EffetInd',
                       style: TextStyle(color: Colors.white, fontSize: 18.0),
                     ),
                   ),
                 ),
                 Tab(
                   child:Container(
                     child: Text(
                       'Interac',
                       style: TextStyle(color: Colors.white, fontSize: 18.0),
                     ),
                   ),
                 ),
                 Tab(
                   child:Container(
                     child: Text(
                       'Plus',
                       style: TextStyle(color: Colors.white, fontSize: 18.0),
                     ),
                   ),
                 ),
        ],
           ),
        ) ),
         body: TabBarView(
           children: [
            Padding(

             padding: EdgeInsets.all(6.0),
              child: SingleChildScrollView(

               /*decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25), topLeft: Radius.circular(25))),*/
                   child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.medicament.name,textAlign: TextAlign.end,style:TextStyle(
                              fontWeight: FontWeight.w200,fontFamily: 'Signatra',fontSize: 40,color: Colors.green.withOpacity(1))),

                          GestureDetector(onTap: () => {},child: Icon(isSelected ? Icons.star : Icons.star_border, size: 45.0,)),
                        ],
                      ),
                      Text('dosage:' , style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                        ),
                      Text(widget.medicament.dosage),
                       Text('forme:' ,textAlign: TextAlign.right,style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.forme),
                       Text('presentation:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.presentation),
                       Text('conditionnement:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),),
                      Text(widget.medicament.conditionnement),
                       Text('specification:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),),
                      Text(widget.medicament.specification),
                       Text('generique:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),),
                      Text(widget.medicament.generique),
                       Text('dci:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),),
                      Text(widget.medicament.dci),
                       Text('classeveic:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.classeveic),
                       Text('subCategory:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.subCategory),
                       Text('fab:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.fab),
                       Text('Laboratoire:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.Laboratoire),
                       Text('Tableau:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.Tableau),
                       Text('conservation:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.conservation),
                       Text('Indication:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.Indication),
                       Text('Princeps:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.Princeps),
                       Text('AMM:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.AMM),
                       Text('DateAMM:' ,textAlign: TextAlign.right,
                         style: TextStyle(fontSize: 14.0, fontFamily: "Band Bold",fontWeight: FontWeight.w600,color: Colors.green.withOpacity(0.8)),
                       ),
                      Text(widget.medicament.DateAMM),

                    ],

                   )
              )
           ),
           Padding(
                     padding: EdgeInsets.all(8.0),
                     child: SingleChildScrollView(

                       /*decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25), topLeft: Radius.circular(25))),*/
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [

                             Text(widget.medicament.generique),
                             Text(widget.medicament.dosage),
                             Text(widget.medicament.conditionnement)
                           ],
                         )
                     )),


                    Text("Bike"),
                   Center(child: Text("Bike"))

           ]
          ),
       ),


    );

  }
}
     /* Scaffold(

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
}*/