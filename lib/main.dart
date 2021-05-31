import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/ASUS/AndroidStudioProjects/medicatn/lib/TabBar2/Details.dart';
import 'package:medicatn/auth/loginScreen.dart';
import 'package:medicatn/core/constants/const.dart';
import 'package:okito/okito.dart';

import 'auth/RegistrationScreen.dart';
import 'navbar/mainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initializing Local Storage
  await OkitoStorage.init(storageName: LOCAL_STORAGE);

  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference usersRef =FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Medica tn",
      theme: ThemeData(
        fontFamily: "Brand-Regular",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.idScreen,
      routes: {
        RegistrationScreen.idScreen: (context)=> RegistrationScreen(),
        LoginScreen.idScreen: (context)=> LoginScreen(),
        MainScreen.idScreen: (context)=> MainScreen(),

      },

      debugShowCheckedModeBanner: false,
    );
  }
}