import 'package:flutter/material.dart';
import 'package:medicatn/core/locator.dart';
import 'package:medicatn/core/services/api_service.dart';

class favScreen extends StatefulWidget {
  @override
  _favScreenState createState() => _favScreenState();
}

class _favScreenState extends State<favScreen> {
  var api;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: api.fetchDrugs(), builder: (context, snapshot) {
          return snapshot.hasData && snapshot.error == null
              ? ListView.builder(
              itemCount: snapshot.data.length, itemBuilder: (context, index) {
            return ListTile(title: Text(snapshot.data[index].name));
          })
              : Center(heightFactor: 30.0, widthFactor: 30.0 ,child: CircularProgressIndicator(strokeWidth: 5.0,));
        })
    );  }

  @override
  void initState() {
    api = locator<ApiService>();
  }
}
