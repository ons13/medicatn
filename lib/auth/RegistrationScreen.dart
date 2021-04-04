import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'loginScreen.dart';
import '../navbar/mainScreen.dart';
import 'package:medicatn/main.dart';
class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";
  TextEditingController nameTextEditingController=TextEditingController();
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController phoneTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey ,
      body:Padding(
        padding:  EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox (height:20.0,),
              Image(
                image:AssetImage( "images/2.png"),
                width: 250.0,
                height:250.0 ,
                alignment: Alignment.center,
              ),
              SizedBox (height: 15.0,),
              Text ( "Register ",
                style:TextStyle(fontSize: 24.0,fontFamily: "Band Bold"),
                textAlign: TextAlign.center ,
              ),
              Padding(
                padding:EdgeInsets.all(20.0),
                child: Column(
                  children:[
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType:TextInputType.text ,
                      decoration: InputDecoration (
                        labelText:"Name",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                        ),
                      ),
                      style:TextStyle(fontSize:14.0),

                    ),
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType:TextInputType.emailAddress ,
                      decoration: InputDecoration (
                        labelText:"Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                        ),
                      ),
                      style:TextStyle(fontSize:14.0),

                    ),
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType:TextInputType.phone ,
                      decoration: InputDecoration (
                        labelText:"Phone",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                        ),
                      ),
                      style:TextStyle(fontSize:14.0),

                    ),
                    SizedBox(height: 1.0,),
                    TextField(
                      controller:passwordTextEditingController ,
                      obscureText:true ,
                      decoration: InputDecoration (
                        labelText:"password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                        ),
                      ),
                      style:TextStyle(fontSize:14.0),

                    ),
                    SizedBox(height: 10.0,),
                    RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white ,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Register",
                            style:TextStyle(fontSize:18.0 , fontFamily: "Brand Blod"),

                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: (){
                        if (nameTextEditingController.text.length<4)
                        {
                          displayToastMessage("name must be atleast 3 Chacarters", context);
                        }
                        else if (!emailTextEditingController.text.contains("@"))
                        {
                          displayToastMessage("Email address is not Valid", context);
                        }
                        else if (phoneTextEditingController.text.isEmpty)
                        {
                          displayToastMessage("Phone Number is Mandatory.", context);
                        }
                        else if (passwordTextEditingController.text.length<6)
                        {
                          displayToastMessage("password must be at least 6 characters  ", context);
                        }
                        else
                        {
                          registerNewUser(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil( context, LoginScreen.idScreen, (route) => false);
                },
                child: Text(
                    "Already have an account! Login here"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    final User user = (await _firebaseAuth
        .createUserWithEmailAndPassword(email:emailTextEditingController.text,
        password:passwordTextEditingController.text
    ).catchError((errMsg){
      displayToastMessage("Error:" + errMsg.toString(), context);
    })).user;

    if (user != null) //user created
        {
      //save user info to database realtime
      Map userDataMap ={
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone":phoneTextEditingController.text.trim(),
      };
      usersRef.child(user.uid).set(userDataMap);
      displayToastMessage("mabrouuuk, ur account has been created ", context);
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    }
    else
    {
      //error
      displayToastMessage("new user account has not been created", context);
    }
  }}
displayToastMessage(String message ,BuildContext context)
{
  Fluttertoast.showToast(msg: message);

}

