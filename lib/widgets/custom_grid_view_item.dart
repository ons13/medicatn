import 'package:flutter/material.dart';

class CustomGridViewItem extends StatefulWidget {
  final String title;
  final Function onClick;
  CustomGridViewItem({this.title, this.onClick,});

  @override
  _CustomGridViewItemState createState() => _CustomGridViewItemState();
}

class _CustomGridViewItemState extends State<CustomGridViewItem> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => widget.onClick,
      child: InkWell(

        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[


              Image.asset("assets/doliprane.jpg"),

              Title(color: Colors.black, child: Text(widget.title, maxLines: 2, style: TextStyle(fontSize: 12),))
            ],
          ),
        ),
        onTap: ()=> "hello ons",
      ),
    );
  }
}
